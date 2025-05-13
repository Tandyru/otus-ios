//
//  ChatView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 26.04.2025.
//

import SwiftUI
import CoreProfile

public struct ChatView: View {
    @StateObject private var viewModel: ChatViewModel

    public init(chatViewModel: ChatViewModel) {
        _viewModel = StateObject(wrappedValue: chatViewModel)
    }
    
    public var body: some View {
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
                .onChange(of: viewModel.messages.count) {
                    scrollToBottom(proxy: proxy)
                }
            }
            
            HStack {
                TextField("Type a message...", text: $viewModel.inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)
                    .onSubmit {
                        viewModel.sendMessage()
                    }
                
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

