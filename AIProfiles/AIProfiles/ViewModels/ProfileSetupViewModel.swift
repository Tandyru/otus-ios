//
//  ProfileSetupViewModel.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import Foundation
import Combine

final class ProfileSetupViewModel: ObservableObject {
    private(set) var profileID: UUID?
    private var profileCreationDate: Date?

    @Inject private var store: AppStore
    private var cancellables = Set<AnyCancellable>()
    
    init(profile: Profile?) {
        profileID = profile?.id
        profileCreationDate = profile?.createdAt
        store.state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard let self = self, let id = self.profileID else { return }
                if state.profiles.contains(where: { $0.id == id }) {
                }
            }
            .store(in: &cancellables)
    }
    
    func saveProfile(title: String, purpose: String, parameters: [PreferenceParameterType]) {
        profileID = profileID ?? UUID()
        profileCreationDate = profileCreationDate ?? Date()
        guard let profileID, let profileCreationDate else {
            return
        }
        let profile = Profile(
            id: profileID,
            title: title,
            purpose: purpose,
            parameters: parameters,
            createdAt: profileCreationDate
        )
        store.dispatch(action: ProfileAction.saveProfile(profile))
    }

}
