//
//  LLMAPIMessage.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 27.04.2025.
//

public struct LLMAPIMessage: Codable {
    public let role: String  // "system", "user" или "assistant"
    public let content: String
    
    public init(role: String, content: String) {
        self.role = role
        self.content = content
    }
}
