//
//  otus_ios_hw_9App.swift
//  otus-ios-hw-9
//
//  Created by Andrey Tanakov on 16.03.2025.
//

import SwiftUI

@main
struct otus_ios_hw_9App: App {
    
    private let appInitializer = AppInitializer()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
