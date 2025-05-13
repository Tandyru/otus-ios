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
                .textSelection(.enabled)
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
        let options = AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace)
        if let attributedText = try? AttributedString(markdown: text, options: options) {
            return attributedText
        }
        return AttributedString(text)
    }
}

