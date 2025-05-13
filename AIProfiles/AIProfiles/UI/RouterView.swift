//
//  RouterView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 13.05.2025.
//

import SwiftUI

struct RouterView<Content: View>: View {
    @inlinable
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Router.Route.self) {
                    router.view(for: $0)
                        .navigationBarBackButtonHidden()
                }
        }
        .environmentObject(router)
    }

    @StateObject private var router = Router()
    private let content: Content
}
