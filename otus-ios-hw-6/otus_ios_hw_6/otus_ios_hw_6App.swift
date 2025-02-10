//
//  otus_ios_hw_6App.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 25.01.2025.
//

import Combine
import SwiftUI

@main
struct otus_ios_hw_6App: App {
    
    private let appInitializer = AppInitializer()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    if url.scheme == "tandyruotushwsix" {
                        handleURL(url)
                    }
                }
        }
    }
    
    private func handleURL(_ url: URL) {
        if url.host == "get-shared-text" {
            let sharedDefaults = UserDefaults(suiteName: "group.com.tandyru.otus-ios-hw-6")
            if let text = sharedDefaults?.string(forKey: "sharedText") {
                let sharedText: SharedText? = ServiceLocator.shared.resolve()
                sharedText?.text = text
            }
        }
    }
}
