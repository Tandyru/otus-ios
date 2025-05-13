//
//  ProfilesReducer.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

final class ProfilesReducer {
    func reduce(state: ProfilesState, action: Action) -> ProfilesState {
        var newState = state
        if let action = action as? ProfileAction {
            switch action {
            case .fetchProfiles:
                newState.isLoading = true
                newState.error = nil
            case .saveProfile:
                newState.isLoading = true
                newState.error = nil
            case .profilesLoaded(.success(let profiles)):
                newState.profiles = profiles
                newState.isLoading = false
            case .profilesLoaded(.failure(let error)):
                newState.error = error
                newState.isLoading = false
            case .deleteProfile:
                newState.isLoading = true
            }
        }
        return newState
    }
}
