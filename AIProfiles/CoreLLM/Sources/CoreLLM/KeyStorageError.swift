//
//  KeyStorageError.swift
//  CoreLLM
//
//  Created by Andrey Tanakov on 12.05.2025.
//

public enum KeyStorageError: Error {
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
