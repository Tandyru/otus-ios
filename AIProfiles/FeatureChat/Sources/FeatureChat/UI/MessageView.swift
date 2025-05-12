//
//  MessageView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 11.05.2025.
//

import SwiftUI

struct MessageView: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
            }
            
            Text(message.attributedText)
                .padding()
                .background(message.isUser ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(message.isUser ? Color.white : .primary)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            if !message.isUser {
                Spacer()
            }
        }
    }
}

fileprivate extension ChatMessage {
    var attributedText: AttributedString {
        if let attributedText = try? AttributedString(markdown: text) {
            return attributedText
        }
        return AttributedString(text)
    }
}
