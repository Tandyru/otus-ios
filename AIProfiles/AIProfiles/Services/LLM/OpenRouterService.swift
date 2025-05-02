//
//  OpenRouterService.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 26.04.2025.
//

import Foundation
import Combine

// OpenRouter key: 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

class OpenRouterService: LLMServiceProtocol {
    private let apiKey = "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"
    private let baseURL = URL(string: "https://openrouter.ai/api/v1/chat/completions")!
    private let model = "deepseek/deepseek-chat-v3-0324:free" // google/palm-2"
    
    func send(messages: [LLMAPIMessage]) async throws -> String {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("AIProfiles", forHTTPHeaderField: "HTTP-Referer")
        
        let requestBody = APIRequest(model: model, messages: messages)
        request.httpBody = try JSONEncoder().encode(requestBody)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let apiResponse: APIResponse
        do {
            apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
        } catch {
            let responseString = String(data: data, encoding: .utf8)
            print("Invalid LLM response. Error \(error). Response: \(responseString)")
            throw error
        }
        guard let firstChoice = apiResponse.choices.first else {
            throw URLError(.cannotParseResponse)
        }
        return firstChoice.message.content
    }
    
    /*
    private let languageSystemMessage = {
        let language = Locale.interfaceLanguageCode
        return APIMessage(role: "system",
                          content: "Always respond in \(languageName(for: language)).")
    }()
    
    func getNextMessage(messages: [ChatMessage]) async throws -> String {
        var apiMessages = messages.map { message in
            APIMessage(role: message.isUser ? "user" : "assistant", content: message.text)
        }
        
        apiMessages = apiMessages.filter { $0.role != "system" }
        apiMessages.insert(languageSystemMessage, at: 0)
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("AIProfiles", forHTTPHeaderField: "HTTP-Referer")
        
        let requestBody = APIRequest(model: model, messages: apiMessages)
        request.httpBody = try JSONEncoder().encode(requestBody)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
        guard let firstChoice = apiResponse.choices.first else {
            throw URLError(.cannotParseResponse)
        }
        
        return firstChoice.message.content
    }
     */
}

fileprivate func languageName(for code: String) -> String {
    Locale.current.localizedString(forLanguageCode: code)?.capitalized ?? "English"
}

fileprivate struct APIRequest: Codable {
    let model: String
    let messages: [LLMAPIMessage]
}

fileprivate struct APIResponse: Codable {
    struct Choice: Codable {
        let message: LLMAPIMessage
    }
    let choices: [Choice]
}
