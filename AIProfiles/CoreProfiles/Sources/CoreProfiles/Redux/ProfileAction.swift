//
//  ProfileAction.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import CoreProfile

public enum ProfileAction: Action {
    case fetchProfiles
    case saveProfile(Profile)
    case deleteProfile(Profile)
    case profilesLoaded(Result<[Profile], Error>)
}
