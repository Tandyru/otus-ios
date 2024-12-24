//
//  City.swift
//  otus-ios-hw-3
//
//  Created by Andrey Tanakov on 24.12.2024.
//

struct City {
    let name: String
}

extension City: Identifiable {
    var id: String {
        name
    }
}
