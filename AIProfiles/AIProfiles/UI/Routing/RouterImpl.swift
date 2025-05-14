//
//  Router.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 13.05.2025.
//

import Combine
import SwiftUI
import CoreRouting
import FeatureSettings

final class RouterImpl: Router {

    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .settings:
            SettingsView()
        }
    }
}
