//
//  City.swift
//  otus-ios-hw-2
//
//  Created by Andrey Tanakov on 22.12.2024.
//

struct City {
    let name: String
}

extension City: Identifiable {
    var id: String {
        name
    }
}
