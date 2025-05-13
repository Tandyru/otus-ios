//
//  AppInitializer.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 24.04.2025.
//

import SwiftUI
import CoreKeychain
import CoreLLM
import CoreProfileStorage
import CoreProfiles
import FeatureChat
import FeatureProfileSetup

final class AppInitializer {
    init() {
        ServiceLocator.shared.register(KeychainService() as KeychainServiceProtocol)
        ServiceLocator.shared.register(
            OpenRouterAPIKeyStorage(
                keychainService: ServiceLocator.shared.resolveOrFail()
            ) as OpenRouterAPIKeyStorageProtocol)
        ServiceLocator.shared.register(CoreDataService.shared as ProfileRepositoryProtocol)
        ServiceLocator.shared.register(
            OpenRouterService(
                keyStorage: ServiceLocator.shared.resolveOrFail()
            ) as LLMServiceProtocol)
        
        ServiceLocator.shared.register(ProfilesStoreFactory.makeStore(repository: ServiceLocator.shared.resolveOrFail()))
    }
}

struct ViewModelProviderEnvironmentKey: EnvironmentKey {
    static let defaultValue: ViewModelProvider = ViewModelProvider()
}

extension EnvironmentValues {
    var viewModelProvider: ViewModelProvider {
        get { self[ViewModelProviderEnvironmentKey.self] }
        set { self[ViewModelProviderEnvironmentKey.self] = newValue }
    }
}

struct ProfileSetupViewModelProviderEnvironmentKey: EnvironmentKey {
    static let defaultValue: FeatureProfileSetup.ViewModelProvider =
        .init(store: ServiceLocator.shared.resolveOrFail(),
              llmService: ServiceLocator.shared.resolveOrFail(),
              chatViewModelFactory: { profile in
                  ChatViewModelFactory(llmService: ServiceLocator.shared.resolveOrFail()).chatViewModel(profile: profile)
              })
}

extension EnvironmentValues {
    var profileSetupViewModelProvider: FeatureProfileSetup.ViewModelProvider {
        get { self[ProfileSetupViewModelProviderEnvironmentKey.self] }
        set { self[ProfileSetupViewModelProviderEnvironmentKey.self] = newValue }
    }
}
