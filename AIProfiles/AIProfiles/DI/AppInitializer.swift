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
import FeatureProfileList
import FeatureSettings

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
        
        FeatureProfileList.ServiceLocator.shared.register(ServiceLocator.shared.resolveOrFail() as ProfilesStore)
        FeatureProfileList.ServiceLocator.shared.register(ServiceLocator.shared.resolveOrFail() as LLMServiceProtocol)
        FeatureProfileSetup.ServiceLocator.shared.register(ServiceLocator.shared.resolveOrFail() as ProfilesStore)
        FeatureProfileSetup.ServiceLocator.shared.register(ServiceLocator.shared.resolveOrFail() as LLMServiceProtocol)
        FeatureProfileSetup.ServiceLocator.initProfileSetupServices()
        FeatureChat.ServiceLocator.shared.register(ServiceLocator.shared.resolveOrFail() as LLMServiceProtocol)
        FeatureChat.ServiceLocator.initChatServices()
        FeatureSettings.ServiceLocator.shared.register(ServiceLocator.shared.resolveOrFail() as OpenRouterAPIKeyStorageProtocol)
    }
}

