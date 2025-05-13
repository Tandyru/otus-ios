//
//  Router.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 13.05.2025.
//

import Combine
import SwiftUI

@MainActor
final class Router: ObservableObject {
    enum Route: Hashable {
//      case goToServices(PasswordViewModel, PasswordTagViewModel)
    }
    // MARK: - Public properties
    
    @Published var path = NavigationPath()
    
    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
//        case let .goToServices(passwordViewModel, passwordTagViewModel):
//            ServicesView(
//                passwordViewModel: passwordViewModel,
//                passwordTagViewModel: passwordTagViewModel
//            )
        default:
            Text("default")
        }
    }
}
