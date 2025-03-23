//
//  otus_ios_hw_10App.swift
//  otus-ios-hw-10
//
//  Created by Andrey Tanakov on 23.03.2025.
//

import SwiftUI

@main
struct otus_ios_hw_10App: App {
    private let appInitializer = AppInitializer()
    
    var body: some Scene {
        WindowGroup {
            CitiesView(viewModel: ViewModelFactory().makeCitiesViewModel())
        }
    }
}
