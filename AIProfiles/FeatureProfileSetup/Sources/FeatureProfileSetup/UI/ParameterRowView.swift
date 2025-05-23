//
//  ParameterRowView.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import SwiftUI
import CoreProfile

struct ParameterRowView: View {
    let parameter: PreferenceParameterType
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(parameter.title)
                    .font(.body)
                    .foregroundColor(.primary)
                Text(parameter.detailDescription)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: parameter.type.icon)
                .foregroundColor(.accentColor)
        }
        .padding(.vertical, 8)
    }
}

extension PreferenceParameterType {
    var title: String {
        switch self {
        case .boolean(let param): return param.title
        case .singleChoice(let param): return param.title
        case .multipleChoice(let param): return param.title
        case .range(let param): return param.title
        case .text(let param): return param.title
        }
    }
    
    var detailDescription: String {
        switch self {
        case .boolean(let param):
            return param.value ? "Да" : "Нет"
            
        case .singleChoice(let param):
            return param.selectedOption
            
        case .multipleChoice(let param):
            return param.selectedOptions.joined(separator: ", ")
            
        case .range(let param):
            return "\(param.currentValue)"
            
        case .text(let param):
            return param.value
        }
    }
}
