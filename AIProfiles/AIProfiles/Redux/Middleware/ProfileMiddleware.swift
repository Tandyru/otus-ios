//
//  ProfileMiddleware.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

final class ProfileMiddleware {
    @Inject private var repository: ProfileRepositoryProtocol
    
    func execute(action: Action, state: AppState, dispatch: @escaping (Action) -> AppState?) {
        guard let profileAction = action as? ProfileAction else { return }

        Task {
            switch profileAction {
            case .fetchProfiles:
                await fetchProfiles(dispatch: dispatch)
            case .saveProfile(let profile):
                do {
                    try await repository.saveProfile(profile)
                } catch {
                    await MainActor.run {
                        // TODO _ = dispatch(ProfileAction.profilesLoaded(.failure(error)))
                    }
                }
                await fetchProfiles(dispatch: dispatch)
            case .deleteProfile(let profile):
                do {
                    try await self.repository.deleteProfile(profile)
                } catch {
                    await MainActor.run {
                        // TODO _ = dispatch(ProfileAction.profilesLoaded(.failure(error)))
                    }
                }
                await fetchProfiles(dispatch: dispatch)
            default:
                break
            }
        }
    }
    
    private func fetchProfiles(dispatch: @escaping (Action) -> AppState?) async {
        do {
            let profiles = try await self.repository.fetchProfiles()
            await MainActor.run {
                _ = dispatch(ProfileAction.profilesLoaded(.success(profiles)))
            }
        } catch {
            await MainActor.run {
                _ = dispatch(ProfileAction.profilesLoaded(.failure(error)))
            }
        }
    }
}
