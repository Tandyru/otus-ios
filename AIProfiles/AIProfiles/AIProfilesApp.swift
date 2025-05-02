//
//  AIProfilesApp.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 24.04.2025.
//

import SwiftUI

@main
struct AIProfilesApp: App {
    private let appInitializer = AppInitializer()

    var body: some Scene {
        WindowGroup {
            ProfileListView(viewModel: ViewModelProvider().profileListViewModel)
                .environment(\.viewModelProvider, ViewModelProvider())
        }
    }
}
