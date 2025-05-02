//
//  PreferenceType+Extensions.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

extension PreferenceType {
    var title: String {
        switch self {
        case .boolean: return "Логический"
        case .singleChoice: return "Одиночный выбор"
        case .multipleChoice: return "Множественный выбор"
        case .range: return "Диапазон"
        case .text: return "Текст"
        }
    }
    
    var icon: String {
        switch self {
        case .boolean: return "checkmark.square"
        case .singleChoice: return "list.bullet"
        case .multipleChoice: return "checklist"
        case .range: return "slider.horizontal.3"
        case .text: return "text.cursor"
        }
    }
}
