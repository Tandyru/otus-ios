//
//  ContentView.swift
//  otus-ios-hw-11
//
//  Created by Andrey Tanakov on 20.04.2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        Button("Drag and Drop View") {
            openWindow(id: "DragAndDropView")
        }
        Button("3D Model Loading View") {
            openWindow(id: "Load3DModelView")
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

