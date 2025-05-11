//
//  KeychainServiceProtocol.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 11.05.2025.
//

protocol KeychainServiceProtocol {
    func save(key: String, value: String) throws
    func get(key: String) throws -> String?
    func delete(key: String) throws
}
