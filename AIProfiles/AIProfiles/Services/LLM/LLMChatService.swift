//
//  LLMChatService.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 27.04.2025.
//

import Foundation

class LLMChatService {
    @Inject private var llmService: LLMServiceProtocol
    
    func getNextMessage(messages: [ChatMessage]) async throws -> String {
        var apiMessages = messages.map { LLMAPIMessage(role: $0.isUser ? "user" : "assistant", content: $0.text) }
        
        let language = Locale.interfaceLanguageCode
        let systemMessage = LLMAPIMessage(role: "system", content: "Always respond in \(Locale.current.localizedString(forLanguageCode: language) ?? "English").")
        apiMessages.insert(systemMessage, at: 0)
        
        return try await llmService.send(messages: apiMessages)
    }
}
