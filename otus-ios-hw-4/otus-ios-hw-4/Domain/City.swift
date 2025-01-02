//
//  City.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 31.12.2024.
//

struct City {
    let name: String
}

extension City: Identifiable {
    var id: String {
        name
    }
}
