//
//  ViewModelProvider.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import CoreProfile
import FeatureChat

final class ViewModelProvider {        
    var profileListViewModel: ProfileListViewModel {
        .init()
    }
    
    private let chatViewModelFactory = ChatViewModelFactory(llmService: ServiceLocator.shared.resolveOrFail())
    
    func chatViewModel(profile: Profile) -> ChatViewModel {
        chatViewModelFactory.chatViewModel(profile: profile)
    }
}
