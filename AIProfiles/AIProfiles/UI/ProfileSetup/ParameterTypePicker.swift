//
//  ParameterTypePicker.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import SwiftUI

struct ParameterTypePicker: View {
    @Binding var selectedType: PreferenceType?
    private let types: [PreferenceType] = [
        .boolean,
        .singleChoice,
        .multipleChoice,
        .range,
        .text
    ]
    
    var body: some View {
        List(types, id: \.self) { type in
            Button(action: { selectedType = type }) {
                HStack {
                    Image(systemName: type.icon)
                    Text(type.title)
                }
            }
        }
        .navigationTitle("Выберите тип")
    }
}
