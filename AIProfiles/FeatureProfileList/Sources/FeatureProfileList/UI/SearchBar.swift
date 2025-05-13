//
//  SearchBar.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            TextField("Поиск профилей", text: $text)
                .textFieldStyle(.plain)
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
