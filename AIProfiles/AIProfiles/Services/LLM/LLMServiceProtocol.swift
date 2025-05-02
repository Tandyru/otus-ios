//
//  LLMService.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 26.04.2025.
//

import Foundation

protocol LLMServiceProtocol {
    func send(messages: [LLMAPIMessage]) async throws -> String
}
