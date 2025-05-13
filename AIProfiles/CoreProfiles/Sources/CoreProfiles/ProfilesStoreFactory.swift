//
//  ProfilesStoreFactory.swift
//  CoreProfiles
//
//  Created by Andrey Tanakov on 13.05.2025.
//

import CoreProfileStorage

@preconcurrency
public class ProfilesStoreFactory {
    public static func makeStore(repository: ProfileRepositoryProtocol) -> ProfilesStore {
        ProfilesStore(initialState: .init(),
                          reducer: ProfilesReducer().reduce(state:action:),
                      middleware: ProfileMiddleware(repository: repository).execute(action:state:dispatch:)
        )
    }
}
