//
//  LLMAPIMessage.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 27.04.2025.
//

struct LLMAPIMessage: Codable {
    let role: String  // "system", "user" или "assistant"
    let content: String
}
