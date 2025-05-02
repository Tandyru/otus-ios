//
//  ProfileRepositoryProtocol.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

protocol ProfileRepositoryProtocol {
    func saveProfile(_ profile: Profile) async throws
    func fetchProfiles() async throws -> [Profile]
    func deleteProfile(_ profile: Profile) async throws
}


