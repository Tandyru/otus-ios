//
//  ContentView.swift
//  otus-ios-hw-9
//
//  Created by Andrey Tanakov on 16.03.2025.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    @State private var isShowingBrowser = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.messages) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding()
                }
                HStack {
                    TextField("Type message...", text: $viewModel.messageText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button(action: viewModel.sendMessage) {
                        Image(systemName: "paperplane.fill")
                            .padding()
                    }
                }
            }
            .navigationTitle("Chat")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    peersButton
                }
            }
        }
        .sheet(isPresented: $isShowingBrowser) {
            BrowserViewControllerRepresentable(
                isPresented: $isShowingBrowser
            )
        }
    }
    
    private var peersButton: some View {
        Button(action: {
            isShowingBrowser = true
        }) {
            Image(systemName: "person.3.fill")
                .foregroundColor(.blue)
        }
    }
}

//#Preview {
//    ContentView(viewModel: ViewModel())
//}
