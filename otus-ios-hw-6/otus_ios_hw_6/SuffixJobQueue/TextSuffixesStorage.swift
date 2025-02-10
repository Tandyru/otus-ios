//
//  TextSuffixesStorage.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 09.02.2025.
//

import Foundation
import Combine

final class TextSuffixesStorage {
    
    struct Item: Hashable, Equatable {
        let textSuffixes: TextSuffixes
        let date: Date
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(date)
        }
        
        static func == (lhs: Item, rhs: Item) -> Bool {
            return lhs.date == rhs.date
        }
    }

    var items: AnyPublisher<Set<Item>, Never> {
        subject.eraseToAnyPublisher()
    }
    
    private let subject = CurrentValueSubject<Set<Item>, Never>(.init())
    
    func save(textSuffixes: TextSuffixes) async {
        await MainActor.run {
            var value = subject.value
            value.insert(.init(textSuffixes: textSuffixes, date: Date()))
            subject.send(value)
        }
    }
}

