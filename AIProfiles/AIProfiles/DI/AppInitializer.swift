//
//  AppInitializer.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 24.04.2025.
//

import SwiftUI

final class AppInitializer {
    init() {
        ServiceLocator.shared.register(KeychainService() as KeychainServiceProtocol)
        ServiceLocator.shared.register(
            OpenRouterAPIKeyStorage(
                keychainService: ServiceLocator.shared.resolveOrFail()
            ) as OpenRouterAPIKeyStorageProtocol)
        ServiceLocator.shared.register(CoreDataService.shared as ProfileRepositoryProtocol)
        ServiceLocator.shared.register(ProfileMiddleware())
        ServiceLocator.shared.register(OpenRouterService() as LLMServiceProtocol)
        ServiceLocator.shared.register(LLMChatService())
        ServiceLocator.shared.register(LLMQuestionnaireService())
        
        //
        let store = AppStore(initialState: .init(),
                          reducer: AppReducer().reduce(state:action:),
                          middleware: AppMiddleware().execute(action:state:dispatch:)
        )
        ServiceLocator.shared.register(store)
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
