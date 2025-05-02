//
//  Locale+extension.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 27.04.2025.
//

import Foundation

extension Locale {
    static var interfaceLanguageCode: String {
        let preferredLanguage = Locale.preferredLanguages.first ?? "en"
        return Locale(identifier: preferredLanguage).language.languageCode?.identifier ?? "en"
    }
}
