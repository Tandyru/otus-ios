//
//  SettingsView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 11.05.2025.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var apiKeyInput: String = ""
    @Inject private var keyStorage: OpenRouterAPIKeyStorageProtocol
    @State private var debounceTask: Task<Void, Never>?
    private let debounceDelay: UInt64 = 500_000_000 // 0.5 секунды

    var body: some View {
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
            // Ждем указанную задержку перед сохранением
            try? await Task.sleep(nanoseconds: debounceDelay)
            
            // Проверяем не отменена ли задача
            guard !Task.isCancelled else { return }
            
            await MainActor.run {
                do {
                    if newValue.isEmpty {
                        try keyStorage.deleteKey()
                    } else {
                        try keyStorage.saveKey(newValue)
                    }
                } catch {
                    print("Ошибка сохранения ключа: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private func loadSavedKey() {
        do {
            apiKeyInput = try keyStorage.getKey()
        } catch {
            if case KeyError.keyNotFound = error {
                apiKeyInput = ""
            }
        }
    }
}
