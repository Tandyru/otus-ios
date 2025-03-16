//
//  MessageBubble.swift
//  otus-ios-hw-9
//
//  Created by Andrey Tanakov on 16.03.2025.
//

import SwiftUI

struct MessageBubble: View {
    let message: Message
    
    var backgroundColor: Color {
        message.isReceived ? Color.blue.opacity(0.2) : Color.green.opacity(0.2)
    }
    
    var body: some View {
        HStack {
            Text(message.text)
                .padding()
                .background(backgroundColor)
                .cornerRadius(10)
                .frame(maxWidth: .infinity, alignment: message.isReceived ? .leading : .trailing)
        }
    }
}
