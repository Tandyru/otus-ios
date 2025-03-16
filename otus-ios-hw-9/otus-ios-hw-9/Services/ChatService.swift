//
//  ChatService.swift
//  otus-ios-hw-9
//
//  Created by Andrey Tanakov on 16.03.2025.
//

import Foundation
import Combine

final class ChatService {
    
    @Published var messages: [Message] = []

    @Inject private var sessionService: SessionService
    private var subscriptions = Array<AnyCancellable>()

    init() {
        sessionService.receivingData.sink { data in
            if let text = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.messages.append(Message(id: UUID().uuidString, text: text, isReceived: true))
                }
            }
        }.store(in: &subscriptions)
    }
        
    func sendMessage(_ text: String) {
        guard let data = text.data(using: .utf8) else { return }
        do {
            try sessionService.send(data: data)
            DispatchQueue.main.async {
                self.messages.append(Message(id: UUID().uuidString,
                                             text: text,
                                             isReceived: false))
            }
        } catch {
            print("Error sending data: \(error.localizedDescription)")
        }
    }
}
