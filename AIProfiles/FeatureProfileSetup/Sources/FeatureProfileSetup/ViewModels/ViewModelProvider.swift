//
//  ViewModelProvider.swift
//  FeatureProfileSetup
//
//  Created by Andrey Tanakov on 13.05.2025.
//

import CoreProfile
import CoreProfiles
import CoreLLM
import FeatureChat

public final class ViewModelProvider: @unchecked Sendable {
    @Inject private var store: ProfilesStore
    
    public init() {
    }
    
    private var profileSetupViewModelStorage: ProfileSetupViewModel? = nil

    func profileSetupViewModel(profile: Profile?) -> ProfileSetupViewModel {
        if let viewModel = profileSetupViewModelStorage, viewModel.profile?.id == profile?.id {
            return viewModel
        }
        let viewModel = ProfileSetupViewModel(profile: profile)
        profileSetupViewModelStorage = viewModel
        return viewModel
    }
    
    func resetProfileSetupViewModel() {
        profileSetupViewModelStorage = nil
    }
}
