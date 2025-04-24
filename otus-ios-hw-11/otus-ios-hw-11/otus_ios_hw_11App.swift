//
//  otus_ios_hw_11App.swift
//  otus-ios-hw-11
//
//  Created by Andrey Tanakov on 20.04.2025.
//

import SwiftUI

@main
struct otus_ios_hw_11App: App {
    @Environment(\.openWindow) private var openWindow
    
    var body: some Scene {
        WindowGroup() {
            ContentView()
        }
        .defaultSize(width: 0.1, height: 0.1, depth: 0, in: .meters)

        WindowGroup(id: "DragAndDropView") {
            DragAndDropView()
        }
        .windowResizability(.contentSize)
        //.defaultSize(width: 0.6, height: 0.4, depth: 1, in: .meters)

        WindowGroup(id: "Load3DModelView") {
            Load3DModelView()
        }
        .defaultSize(width: 0.8, height: 0.6, depth: 1.1, in: .meters)
    }
}
