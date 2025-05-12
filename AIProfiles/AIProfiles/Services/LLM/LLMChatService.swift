//
//  LLMChatService.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 27.04.2025.
//

import Foundation
import CoreProfile
import CoreLLM

class LLMChatService {
    @Inject private var llmService: LLMServiceProtocol
    
    func getNextMessage(messages: [ChatMessage], profile: Profile) async throws -> String {

        var apiMessages = messages.map { LLMAPIMessage(role: $0.isUser ? "user" : "assistant", content: $0.text) }

        let systemPrompt = """
        You are an assistant following the instructions of the profile:
        \(profile.profileDescription)
        Answer questions strictly according to these parameters.
        """
        let profileSystemMessage = LLMAPIMessage(role: "system", content: systemPrompt)
        apiMessages.insert(profileSystemMessage, at: 0)

        let language = Locale.interfaceLanguageCode
        let languageSystemMessage = LLMAPIMessage(role: "system", content: "Always respond in \(Locale.current.localizedString(forLanguageCode: language) ?? "English").")
        apiMessages.insert(languageSystemMessage, at: 0)
        
        return try await llmService.send(messages: apiMessages)
    }
}

extension Profile {
    var profileDescription: String {
        let params = parameters.map { param -> String in
            switch param {
            case .boolean(let p):
                return "\(p.title): \(p.value ? "Yes" : "No")"
            case .singleChoice(let p):
                return "\(p.title): \(p.selectedOption)"
            case .multipleChoice(let p):
                return "\(p.title): \(p.selectedOptions.joined(separator: ", "))"
            case .range(let p):
                return "\(p.title): \(p.currentValue) (range:\(p.min)-\(p.max))"
            case .text(let p):
                return "\(p.title): \(p.value)"
            }
        }.joined(separator: "\n")
        return "Purpose:\(purpose)\nParameters:\n\(params)"
    }
}
