//
//  DragAndDropContentView.swift
//  otus-ios-hw-11
//
//  Created by Andrey Tanakov on 20.04.2025.
//

import SwiftUI
import UniformTypeIdentifiers
import RealityKit

struct DragAndDropView: View {
    let animals: [String] = [
        "🐘",
        "🦒",
        "🐬"]
    @State private var droppedAnimals: [String] = []

    var body: some View {
        VStack {
            HStack {
                ForEach(animals, id: \.self)  { animal in
                    Text(animal)
                        .font(.system(size: 150))
                        .onDrag {
                            return NSItemProvider(object: animal as NSString)
                        }
                }
            }
            HStack {
                if droppedAnimals.count > 0 {
                    ForEach(droppedAnimals, id: \.self)  { animal in
                        Text(animal)
                            .font(.system(size: 150))
                    }
                } else {
                    Text("drop here")
                        .frame(width: 200, height: 100)
                        .background(.yellow)
                }
            }
            .dropDestination(for: String.self) { items, location in
                droppedAnimals.append(contentsOf: items)
                return true
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    DragAndDropView()
}
