//
//  otus_ios_hw_4App.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 31.12.2024.
//

import SwiftUI

@main
struct otus_ios_hw_4App: App {
    private let appInitializer = AppInitializer()
    
    var body: some Scene {
        WindowGroup {
            CitiesView(viewModel: ViewModelFactory().makeCitiesViewModel())
        }
    }
}
