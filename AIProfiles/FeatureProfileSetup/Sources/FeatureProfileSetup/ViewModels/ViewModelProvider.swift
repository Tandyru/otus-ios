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

public final class ViewModelProvider {
    private let store: ProfilesStore
    private let llmService: LLMQuestionnaireService
    private let chatViewModelFactory: (Profile) -> ChatViewModel
    
    public init(store: ProfilesStore,
                llmService: LLMServiceProtocol,
                chatViewModelFactory: @escaping (Profile) -> ChatViewModel
    ) {
        self.store = store
        self.llmService = .init(llmService: llmService)
        self.chatViewModelFactory = chatViewModelFactory
    }
    
    private var profileSetupViewModelStorage: ProfileSetupViewModel? = nil

    func profileSetupViewModel(profile: Profile?) -> ProfileSetupViewModel {
        if let viewModel = profileSetupViewModelStorage, viewModel.profile?.id == profile?.id {
            return viewModel
        }
        let viewModel = ProfileSetupViewModel(profile: profile, store: store)
        profileSetupViewModelStorage = viewModel
        return viewModel
    }
    
    func resetProfileSetupViewModel() {
        profileSetupViewModelStorage = nil
    }
    
    func profileQuestionnaireViewModel(purpose: String) -> ProfileQuestionnaireViewModel {
        ProfileQuestionnaireViewModel(purpose: purpose, llmService: llmService)
    }
    
    func chatViewModel(profile: Profile) -> ChatViewModel {
        chatViewModelFactory(profile)
    }
}
