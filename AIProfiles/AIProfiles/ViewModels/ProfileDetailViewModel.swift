//
//  ProfileDetailViewModel.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import Foundation
import Combine

final class ProfileDetailViewModel: ObservableObject {
    @Published var profile: Profile?
    private let profileId: UUID
    @Inject private var store: AppStore
    private var cancellables = Set<AnyCancellable>()
    
    init(profileId: UUID) {
        self.profileId = profileId
        store.state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                self?.profile = state.profiles.first { $0.id == profileId }
            }
            .store(in: &cancellables)
    }
}
