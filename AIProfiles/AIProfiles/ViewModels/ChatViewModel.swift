//
//  ChatViewModel.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 26.04.2025.
//

import Foundation
import Combine

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var inputText = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Inject private var chatService: LLMChatService
    private let profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
    
    func sendMessage() {
        guard !inputText.isEmpty else { return }
                
        let userMessage = ChatMessage(text: inputText, isUser: true, timestamp: Date())
        messages.append(userMessage)
        
        inputText = ""

        isLoading = true
        Task {
            do {
                let response = try await chatService.getNextMessage(messages: messages)
                await MainActor.run {
                    let assistantMessage = ChatMessage(text: response, isUser: false, timestamp: Date())
                    messages.append(assistantMessage)
                    isLoading = false
                }
            } catch {
                await MainActor.run {
                    isLoading = false
                    errorMessage = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}
