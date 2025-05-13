//
//  ProfileSetupViewModelProviderEnvironmentKey.swift
//  FeatureProfileList
//
//  Created by Andrey Tanakov on 13.05.2025.
//

import SwiftUI
import FeatureChat

@preconcurrency
public struct ProfileSetupViewModelProviderEnvironmentKey: EnvironmentKey {
    public static let defaultValue = ViewModelProvider()
}

public extension EnvironmentValues {
    var profileSetupViewModelProvider: ViewModelProvider {
        get { self[ProfileSetupViewModelProviderEnvironmentKey.self] }
        set { self[ProfileSetupViewModelProviderEnvironmentKey.self] = newValue }
    }
}
