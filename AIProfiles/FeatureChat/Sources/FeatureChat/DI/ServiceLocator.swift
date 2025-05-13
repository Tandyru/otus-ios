//
//  ServiceLocator.swift
//  FeatureChat
//
//  Created by Andrey Tanakov on 13.05.2025.
//

import CoreUtils

public typealias ServiceLocator = CoreUtils.ServiceLocator

public typealias Inject<Service> = CoreUtils.Inject<Service>

public extension FeatureChat.ServiceLocator {
    static func initChatServices() {
        shared.register(LLMChatService())
    }
}
