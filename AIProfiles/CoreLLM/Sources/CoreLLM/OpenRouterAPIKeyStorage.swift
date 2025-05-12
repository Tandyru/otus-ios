//
//  OpenRouterAPIKeyStorage.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 11.05.2025.
//

import Foundation
import CoreKeychain

public final class OpenRouterAPIKeyStorage: OpenRouterAPIKeyStorageProtocol {
    private var keychainService: KeychainServiceProtocol
    private let keyIdentifier = "OpenRouterAPIKey"
    
    public init(keychainService: KeychainServiceProtocol) {
        self.keychainService = keychainService
    }
    
    public func saveKey(_ key: String) throws {
        guard !key.isEmpty else {
            throw KeyStorageError.emptyKey
        }
        try keychainService.save(key: keyIdentifier, value: key)
    }
    
    public func getKey() throws -> String {
        guard let key = try keychainService.get(key: keyIdentifier) else {
            throw KeyStorageError.keyNotFound
        }
        return key
    }
    
    public func deleteKey() throws {
        try keychainService.delete(key: keyIdentifier)
    }
}
