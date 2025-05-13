//
//  ProfileMiddleware.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import CoreProfileStorage

final class ProfileMiddleware: @unchecked Sendable {
    private let repository: ProfileRepositoryProtocol
    
    init(repository: ProfileRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(action: Action, state: ProfilesState, dispatch: @escaping @MainActor (Action) -> ProfilesState?) {
        Task {
            guard let profileAction = action as? ProfileAction else { return }
            switch profileAction {
            case .fetchProfiles:
                await self.fetchProfiles(dispatch: dispatch)
            case .saveProfile(let profile):
                do {
                    try await repository.saveProfile(profile)
                } catch {
                    await MainActor.run {
                        // TODO _ = dispatch(ProfileAction.profilesLoaded(.failure(error)))
                    }
                }
                await self.fetchProfiles(dispatch: dispatch)
            case .deleteProfile(let profile):
                do {
                    try await repository.deleteProfile(profile)
                } catch {
                    await MainActor.run {
                        // TODO _ = dispatch(ProfileAction.profilesLoaded(.failure(error)))
                    }
                }
                await self.fetchProfiles(dispatch: dispatch)
            default:
                break
            }
        }
    }
    
    func fetchProfiles(dispatch: @escaping @MainActor (Action) -> ProfilesState?) async {
        do {
            let profiles = try await repository.fetchProfiles()
            await MainActor.run {
                _ = dispatch(ProfileAction.profilesLoaded(.success(profiles)))
            }
        } catch {
            await MainActor.run {
                _ = dispatch(ProfileAction.profilesLoaded(.failure(error)))
            }
        }
    }
}
