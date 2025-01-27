//
//  otus_ios_hw_5App.swift
//  otus-ios-hw-5
//
//  Created by Andrey Tanakov on 25.01.2025.
//

import SwiftUI

@main
struct otus_ios_hw_5App: App {
    let viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
                .onOpenURL { url in
                    if url.scheme == "tandyruotushwfive" {
                        handleURL(url)
                    }
                }
        }
    }
    
    private func handleURL(_ url: URL) {
        if url.host == "get-shared-text" {
            let sharedDefaults = UserDefaults(suiteName: "group.com.tandyru.otus-ios-hw-5")
            if let text = sharedDefaults?.string(forKey: "sharedText") {
                viewModel.text = text
            }
        }
    }
}
