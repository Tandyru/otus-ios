//
//  SettingsViewModel.swift
//  FeatureSettings
//
//  Created by Andrey Tanakov on 13.05.2025.
//

import Combine
import CoreLLM

public final class SettingsViewModel: ObservableObject {
    @Inject private var keyStorage: OpenRouterAPIKeyStorageProtocol
    
    public init() {
    }

    func saveKey(_ key: String) {
        do {
            if key.isEmpty {
                try keyStorage.deleteKey()
            } else {
                try keyStorage.saveKey(key)
            }
        } catch {
            print("Ошибка сохранения ключа: \(error.localizedDescription)")
        }
    }
    
    func getKey() -> String {
        do {
            return try keyStorage.getKey()
        } catch {
            if case KeyStorageError.keyNotFound = error {
                return ""
            }
            return ""
        }
    }
}
