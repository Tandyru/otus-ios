//
//  AppState.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import CoreProfile

struct AppState {
    var profiles: [Profile] = []
    var error: Error? = nil
    var isLoading: Bool = false
}
