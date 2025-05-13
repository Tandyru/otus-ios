//
//  ProfileSetupViewModel.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import Foundation
import Combine
import CoreProfile
import CoreProfiles

final class ProfileSetupViewModel: ObservableObject {
    var profile: Profile?

    private let store: ProfilesStore
    private var cancellables = Set<AnyCancellable>()
    
    init(profile: Profile?, store: ProfilesStore) {
        self.profile = profile
        self.store = store
        store.state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard let self = self, let id = self.profile?.id else { return }
                if state.profiles.contains(where: { $0.id == id }) {
                }
            }
            .store(in: &cancellables)
    }
    
    func saveProfile(title: String, purpose: String, parameters: [PreferenceParameterType]) {
        self.profile = Profile(
            id: profile?.id ?? UUID(),
            title: title,
            purpose: purpose,
            parameters: parameters,
            createdAt: profile?.createdAt ?? Date()
        )
        store.dispatch(action: ProfileAction.saveProfile(profile!))
    }

    func deleteProfile() {
        if let profile = profile {
            store.dispatch(action: ProfileAction.deleteProfile(profile))
            self.profile = nil
        }
    }
}
