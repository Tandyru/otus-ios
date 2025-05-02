//
//  AppState.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

struct AppState {
    var profiles: [Profile] = []
    var error: Error? = nil
    var isLoading: Bool = false
}
