//
//  SettingsView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 11.05.2025.
//

import SwiftUI

public struct SettingsView: View {
    @StateObject var viewModel: SettingsViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var apiKeyInput: String = ""
    @State private var debounceTask: Task<Void, Never>?
    private let debounceDelay: UInt64 = 500_000_000 // 0.5 секунды

    public init() {
        _viewModel = StateObject(wrappedValue: SettingsViewModel())
    }
    
    public var body: some View {
        NavigationStack {
            Form {
                Section("OpenRouter API Key") {
                    SecureField("Введите ваш API ключ", text: $apiKeyInput)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
            }
            .navigationTitle("Настройки")
            .onChange(of: apiKeyInput) { _, newValue in
                handleKeyChange(newValue: newValue)
            }
            .onAppear {
                loadSavedKey()
            }
        }
    }
    
    private func handleKeyChange(newValue: String) {
        debounceTask?.cancel()
        debounceTask = Task {
            try? await Task.sleep(nanoseconds: debounceDelay)
            guard !Task.isCancelled else { return }
            await MainActor.run {
                viewModel.saveKey(newValue)
            }
        }
    }
    
    private func loadSavedKey() {
        apiKeyInput = viewModel.getKey()
    }
}
