//
//  AppState.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import CoreProfile

public struct ProfilesState {
    public var profiles: [Profile] = []
    public var error: Error? = nil
    public var isLoading: Bool = false
}
