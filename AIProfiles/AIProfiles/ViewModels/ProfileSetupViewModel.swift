//
//  ProfileSetupViewModel.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import Foundation
import Combine

final class ProfileSetupViewModel: ObservableObject {
    @Published var isSaved = false
    var profileID: UUID?

    @Inject private var store: AppStore
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        store.state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard let self = self, let id = self.profileID else { return }
                if state.profiles.contains(where: { $0.id == id }) {
                    self.isSaved = true
                }
            }
            .store(in: &cancellables)
    }
    
    func createProfile(title: String, purpose: String, parameters: [PreferenceParameterType]) {
        let profile = Profile(
            id: UUID(),
            title: title,
            purpose: purpose,
            parameters: parameters,
            createdAt: Date()
        )
        profileID = profile.id
        store.dispatch(action: ProfileAction.saveProfile(profile))
    }
    
    func updateProfile(_ profile: Profile, title: String, purpose: String, parameters: [PreferenceParameterType]) {
        var updatedProfile = profile
        updatedProfile.title = title
        updatedProfile.purpose = purpose
        updatedProfile.parameters = parameters
        profileID = profile.id
        store.dispatch(action: ProfileAction.saveProfile(updatedProfile))
    }

}
