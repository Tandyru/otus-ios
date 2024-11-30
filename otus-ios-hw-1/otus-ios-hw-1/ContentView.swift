//
//  ContentView.swift
//  otus-ios-hw-1
//
//  Created by Andrey Tanakov on 30.11.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var path: [Animal] = []
    @State private var selectedTab: Int = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            SingleButtonScreen(selectAnimal: { animal in
                selectedTab = 1
                path = [.giraffe]
            })
                .tag(0)
                .tabItem {
                    Label("Link Button", systemImage: "link.circle")
                }
            AnimalListScreen(path: $path)
                .tag(1)
                .tabItem {
                    Label("Animals", systemImage: "list.bullet.circle")
                }
            AboutScreen()
                .tag(2)
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
