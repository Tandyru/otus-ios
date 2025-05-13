//
//  CoreDataService.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import CoreData
import CoreProfile

public class CoreDataService: ProfileRepositoryProtocol, @unchecked Sendable {
    public static let shared = CoreDataService()
    
    private let container: NSPersistentContainer
    private var viewContext: NSManagedObjectContext {
        container.viewContext
    }
    
    private init() {
        let modelName = "AIProfiles"
        guard let modelURL = Bundle.module.url(forResource: modelName, withExtension: "momd"),
                  let model = NSManagedObjectModel(contentsOf: modelURL)
        else {
            fatalError("Failed to load Core Data model")
        }
        container = NSPersistentContainer(name: modelName, managedObjectModel: model)
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    public func saveProfile(_ profile: Profile) async throws {
        try await withCheckedThrowingContinuation { continuation in
            container.performBackgroundTask { context in
                do {
                    let request: NSFetchRequest<ProfileEntity> = ProfileEntity.fetchRequest()
                    request.predicate = NSPredicate(format: "uid == %@", profile.id as CVarArg)
                    
                    if let existingEntity = try? context.fetch(request).first {
                        existingEntity.title = profile.title
                        existingEntity.purpose = profile.purpose
                        existingEntity.parameters = try JSONEncoder().encode(profile.parameters)
                    } else {
                        let entity = ProfileEntity(context: context)
                        entity.uid = profile.id
                        entity.title = profile.title
                        entity.purpose = profile.purpose
                        entity.parameters = try JSONEncoder().encode(profile.parameters)
                        entity.createdAt = profile.createdAt
                    }

                    try context.save()
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    public func fetchProfiles() async throws -> [Profile] {
        try await withCheckedThrowingContinuation { continuation in
            container.performBackgroundTask { context in
                do {
                    let request: NSFetchRequest<ProfileEntity> = ProfileEntity.fetchRequest()
                    request.sortDescriptors = [NSSortDescriptor(keyPath: \ProfileEntity.createdAt, ascending: false)]

                    let entities = try context.fetch(request)
                    let profiles = try entities.compactMap { entity -> Profile? in
                        guard
                            let id = entity.uid,
                            let title = entity.title,
                            let purpose = entity.purpose,
                            let createdAt = entity.createdAt,
                            let parametersData = entity.parameters
                        else { return nil }

                        let parameters = try JSONDecoder().decode([PreferenceParameterType].self, from: parametersData)
                        return Profile(id: id, title: title, purpose: purpose, parameters: parameters, createdAt: createdAt)
                    }
                    continuation.resume(returning: profiles)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    public func deleteProfile(_ profile: Profile) async throws {
        try await withCheckedThrowingContinuation { continuation in
            container.performBackgroundTask { context in
                do {
                    let request: NSFetchRequest<ProfileEntity> = ProfileEntity.fetchRequest()
                    request.predicate = NSPredicate(format: "uid == %@", profile.id as CVarArg)

                    let entities = try context.fetch(request)
                    entities.forEach { context.delete($0) }
                    try context.save()
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
