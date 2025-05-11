//
//  ProfileListViewModel.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 24.04.2025.
//

import Foundation
import Combine

class ProfileListViewModel: ObservableObject {

    @Published var profiles: [Profile] = []
    @Published var searchText: String = ""
    @Published var error: String? = nil
    
    @Inject private var store: AppStore
    private var cancellables = Set<AnyCancellable>()
    private var allProfiles: [Profile] = []
    
    init() {
        
        store.state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard let self else { return }
                self.allProfiles = state.profiles
                self.filterProfiles(text: searchText)
                if let error = state.error {
                    self.error = error.localizedDescription
                }
            }.store(in: &cancellables)
        
        $searchText.sink { [weak self] text in
            self?.filterProfiles(text: text)
        }.store(in: &cancellables)
        
        fetchProfiles()
    }
    
    func fetchProfiles() {
        store.dispatch(action: ProfileAction.fetchProfiles)
    }
        
    func deleteProfile(_ profile: Profile) {
        store.dispatch(action: ProfileAction.deleteProfile(profile))
    }
    
    private func filteredProfiles(_ profiles: [Profile], searchText: String) -> [Profile] {
        if searchText.isEmpty {
            return profiles
        } else {
            return profiles.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.purpose.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    private func filterProfiles(text: String) {
        self.profiles = self.filteredProfiles(allProfiles, searchText: text)
    }
}
