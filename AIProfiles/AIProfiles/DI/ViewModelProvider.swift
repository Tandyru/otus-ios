//
//  ViewModelProvider.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

final class ViewModelProvider {
    @Inject private var store: AppStore
        
    var profileListViewModel: ProfileListViewModel {
        .init()
    }
    
    var profileSetupViewModel = ResettableLazy<ProfileSetupViewModel> {
        .init()
    }
    
    func chatViewModel(profile: Profile) -> ChatViewModel {
        .init(profile: profile)
    }
}
