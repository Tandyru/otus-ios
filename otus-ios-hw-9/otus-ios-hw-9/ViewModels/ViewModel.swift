//
//  ViewModel.swift
//  otus-ios-hw-9
//
//  Created by Andrey Tanakov on 16.03.2025.
//

import Combine

final class ViewModel: ObservableObject {

    @Published var messages: [Message] = []
    @Published var messageText = ""

    @Inject private var chatService: ChatService
    private var subscriptions = Array<AnyCancellable>()

    init() {
        chatService.$messages
            .assign(to: \.messages, on: self)
            .store(in: &subscriptions)
    }
        
    func sendMessage() {
        guard !messageText.isEmpty else { return }
        chatService.sendMessage(messageText)
        messageText = ""
    }
}
