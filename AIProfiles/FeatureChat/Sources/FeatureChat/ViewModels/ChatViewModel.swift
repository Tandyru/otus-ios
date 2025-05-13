//
//  ChatViewModel.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 26.04.2025.
//

import Foundation
import Combine
import CoreProfile

@preconcurrency
public class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var inputText = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    var profileTitle: String {
        profile.title
    }
    @Inject private var chatService: LLMChatService
    private let profile: Profile
    
    public init(profile: Profile) {
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
                let response = try await chatService.getNextMessage(messages: messages, profile: profile)
                await MainActor.run {
                    let assistantMessage = ChatMessage(text: response, isUser: false, timestamp: Date())
                    self.messages.append(assistantMessage)
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.isLoading = false
                    errorMessage = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}
