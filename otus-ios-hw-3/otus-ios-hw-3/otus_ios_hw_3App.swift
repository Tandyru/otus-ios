//
//  otus_ios_hw_3App.swift
//  otus-ios-hw-3
//
//  Created by Andrey Tanakov on 24.12.2024.
//

import SwiftUI

@main
struct otus_ios_hw_3App: App {
    private let appInitializer = AppInitializer()
    
    var body: some Scene {
        WindowGroup {
            CitiesView()
        }
    }
}
