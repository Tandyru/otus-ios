//
//  AppInitializer.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 09.02.2025.
//

final class AppInitializer {
    private let textSuffixesSaver: TextSuffixesSaver
    
    init() {
        ServiceLocator.shared.register(SharedText())        
        ServiceLocator.shared.register(TextSuffixesStorage())
        ServiceLocator.shared.register(JobScheduler())
        textSuffixesSaver = .init()
    }
}
