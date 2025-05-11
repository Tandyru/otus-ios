//
//  OpenRouterAPIKeyStorage.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 11.05.2025.
//

import Foundation

final class OpenRouterAPIKeyStorage: OpenRouterAPIKeyStorageProtocol {
    @Inject private var keychainService: KeychainServiceProtocol
    private let keyIdentifier = "OpenRouterAPIKey"
    
    init(keychainService: KeychainServiceProtocol) {
        self.keychainService = keychainService
    }
    
    func saveKey(_ key: String) throws {
        guard !key.isEmpty else {
            throw KeyError.emptyKey
        }
        try keychainService.save(key: keyIdentifier, value: key)
    }
    
    func getKey() throws -> String {
        guard let key = try keychainService.get(key: keyIdentifier) else {
            throw KeyError.keyNotFound
        }
        return key
    }
    
    func deleteKey() throws {
        try keychainService.delete(key: keyIdentifier)
    }
}

enum KeyError: Error {
    case keyNotFound
    case emptyKey
    case keychainError(Error)
    
    var localizedDescription: String {
        switch self {
        case .keyNotFound:
            return "API ключ не найден"
        case .emptyKey:
            return "Ключ не может быть пустым"
        case .keychainError(let error):
            return "Ошибка Keychain: \(error.localizedDescription)"
        }
    }
}
