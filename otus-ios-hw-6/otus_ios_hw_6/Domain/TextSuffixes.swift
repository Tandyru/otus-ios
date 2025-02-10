//
//  TextSuffixes.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 09.02.2025.
//

struct Suffix: Hashable {
    let suffix: String
    let count: Int
}

struct TextSuffixes {
    let text: String
    let suffixes: [Suffix]
}
