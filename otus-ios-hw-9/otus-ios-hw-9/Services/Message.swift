//
//  Message.swift
//  otus-ios-hw-9
//
//  Created by Andrey Tanakov on 16.03.2025.
//

struct Message: Identifiable {
    let id: String // UUID
    let text: String
    let isReceived: Bool
}
