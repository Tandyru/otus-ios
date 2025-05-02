//
//  AppMiddleware.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

final class AppMiddleware {
    @Inject var profileMiddleware: ProfileMiddleware
    
    func execute(action: Action, state: AppState, dispatch: @escaping (Action) -> AppState?) {
        profileMiddleware.execute(action: action, state: state, dispatch: dispatch)
    }
}
