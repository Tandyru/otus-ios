//
//  AppInitializer.swift
//  otus-ios-hw-9
//
//  Created by Andrey Tanakov on 16.03.2025.
//

final class AppInitializer {
    init() {
        ServiceLocator.shared.register(ServiceTypeProvider())
        ServiceLocator.shared.register(MyPeerIDProvider())
        ServiceLocator.shared.register(SessionService())
        ServiceLocator.shared.register(PeeringService())
        ServiceLocator.shared.register(ChatService())
    }
}
