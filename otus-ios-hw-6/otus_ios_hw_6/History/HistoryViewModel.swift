//
//  HistoryViewModel.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 08.02.2025.
//

import Foundation
import Combine

final class HistoryViewModel: ObservableObject {
    
    struct Item: Identifiable {
        var id: Date {
            date
        }
        let text: String
        let date: Date
    }
    
    @Published var items: [Item] = []
    
    @Inject var textSuffixesStorage: TextSuffixesStorage
    
    private var suffixes: [Date: TextSuffixes] = [:]

    private var subscriptions = Array<AnyCancellable>()

    init() {
        textSuffixesStorage.items.sink { [weak self] items in
            assert(Thread.isMainThread)
            self?.items = items.map { .init(text: $0.textSuffixes.text, date: $0.date) }.sorted { $0.date > $1.date }
            self?.suffixes = items.reduce(into: [Date: TextSuffixes]()) { result, item in
                result[item.date] = item.textSuffixes
            }
        }.store(in: &subscriptions)
    }
    
    func getTuffixesByDate(_ date: Date) -> TextSuffixes? {
        suffixes[date]
    }
}
