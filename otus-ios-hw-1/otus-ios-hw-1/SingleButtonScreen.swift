//
//  SingleButtonScreen.swift
//  otus-ios-hw-1
//
//  Created by Andrey Tanakov on 30.11.2024.
//

import SwiftUI

struct SingleButtonScreen: View {
    let selectAnimal: (Animal) -> Void
    
    var body: some View {
        Button {
            selectAnimal(.giraffe)
        } label: {
            Text("Show Giraffe").font(.system(size: 30))
        }
    }
}

#Preview {
    SingleButtonScreen(selectAnimal: { print("\($0)") })
}
