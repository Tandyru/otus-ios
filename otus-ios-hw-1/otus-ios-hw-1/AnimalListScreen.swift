//
//  AnimalListScreen.swift
//  otus-ios-hw-1
//
//  Created by Andrey Tanakov on 30.11.2024.
//

import SwiftUI

let animals: [Animal] = [.lion, .elephant, .giraffe, .dolphin, .panda]

struct AnimalListScreen: View {
    @Binding var path: [Animal]

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(animals, id: \.self) { animal in
                    NavigationLink(value: animal) {
                        Text(animal.name)
                            .font(.system(size: 30))
                            .padding()
                    }
                }
            }
            .navigationDestination(for: Animal.self) { animal in
                AnimalDetailView(animal: animal)
            }
            .navigationTitle("Animals")
        }
    }
}

extension Animal {
    var name: String {
        switch self {
        case .lion:
            return "Lion"
        case .elephant:
            return "Elephant"
        case .giraffe:
            return "Giraffe"
        case .dolphin:
            return "Dolphin"
        case .panda:
            return "Panda"
        }
    }
    
    var icon: String {
        switch self {
        case .lion:
            return "🦁"
        case .elephant:
            return "🐘"
        case .giraffe:
            return "🦒"
        case .dolphin:
            return "🐬"
        case .panda:
            return "🐼"
        }
    }
}

struct AnimalDetailView: View {
    let animal: Animal
    
    var body: some View {
        VStack {
            Text(animal.icon)
                .font(.system(size: 250))
            Text(animal.name)
                .font(.system(size: 50))
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var path: [Animal] = []
    AnimalListScreen(path: $path)
}
