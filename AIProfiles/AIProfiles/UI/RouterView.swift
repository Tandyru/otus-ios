//
//  RouterView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 13.05.2025.
//

import SwiftUI
import CoreRouting

struct RouterView<Content: View>: View {
    @inlinable
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: Route.self) {
                    router.view(for: $0)
//                        .navigationBarBackButtonHidden()
                }
        }
        .environmentObject(router as Router)
    }

    @StateObject private var router = RouterImpl()
    private let content: Content
}
