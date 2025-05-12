//
//  ChatViewModelFactory.swift
//  FeatureChat
//
//  Created by Andrey Tanakov on 12.05.2025.
//

import CoreProfile
import CoreLLM

public class ChatViewModelFactory {
    private let llmService: LLMServiceProtocol
    
    public init(llmService: LLMServiceProtocol) {
        self.llmService = llmService
    }
    
    public func chatViewModel(profile: Profile) -> ChatViewModel {
        .init(chatService: LLMChatService(llmService: llmService), profile: profile)
    }
}
