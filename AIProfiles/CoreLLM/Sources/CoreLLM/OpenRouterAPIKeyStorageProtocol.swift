//
//  OpenRouterAPIKeyStorageProtocol.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 11.05.2025.
//

public protocol OpenRouterAPIKeyStorageProtocol {
    func saveKey(_ key: String) throws
    func getKey() throws -> String
    func deleteKey() throws
}
