//
//  ViewModelProvider.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import CoreProfile
import FeatureChat

final class ViewModelProvider {
    @Inject private var store: AppStore
        
    var profileListViewModel: ProfileListViewModel {
        .init()
    }
    
    private var profileSetupViewModelStorage: ProfileSetupViewModel? = nil
    private let chatViewModelFactory = ChatViewModelFactory(llmService: ServiceLocator.shared.resolveOrFail())
    
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

    func chatViewModel(profile: Profile) -> ChatViewModel {
        chatViewModelFactory.chatViewModel(profile: profile)
    }
}
