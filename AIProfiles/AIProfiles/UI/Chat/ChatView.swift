//
//  ChatView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 26.04.2025.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel: ChatViewModel
    
    init(profile: Profile) {
        _viewModel = StateObject(wrappedValue: ChatViewModel(profile: profile))
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text("Профиль: \(viewModel.profileTitle)")
                    .font(.headline)
                    .foregroundStyle(Color.secondary)
                Spacer()
            }
            .padding()
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.messages) { message in
                            MessageView(message: message)
                        }
                    }
                    .padding()
                }
                .onChange(of: viewModel.messages.count) { _ in
                    scrollToBottom(proxy: proxy)
                }
            }
            
            HStack {
                TextField("Type a message...", text: $viewModel.inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)
                
                Button {
                    viewModel.sendMessage()
                } label: {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        Image(systemName: "paperplane.fill")
                    }
                }
                .disabled(viewModel.isLoading)
            }
            .padding()
        }
    }
    
    private func scrollToBottom(proxy: ScrollViewProxy) {
        guard let lastMessage = viewModel.messages.last else { return }
        proxy.scrollTo(lastMessage.id, anchor: .bottom)
    }
}

// Представление сообщения
struct MessageView: View {
    let message: ChatMessage
    
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
            }
            
            Text(message.text)
                .padding()
                .background(message.isUser ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(message.isUser ? .white : .primary)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            if !message.isUser {
                Spacer()
            }
        }
    }
}
