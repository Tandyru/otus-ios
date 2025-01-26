//
//  ViewModel.swift
//  otus-ios-hw-5
//
//  Created by Andrey Tanakov on 25.01.2025.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    struct SuffixWithStats: Identifiable {
        var id: String {
            suffix
        }
        let suffix: String
        let count: Int
    }
    
    enum SortBy: String {
        case asc = "ASC"
        case desc = "DESC"
    }
    
    @Published var text: String = "Repeating the beating of heating hearts, starting the parting of darting arts, charting the smarting of carting parts."
    @Published var lexSortedSuffixes: [SuffixWithStats]? = nil
    @Published var top10Suffixes: [SuffixWithStats]? = nil
    @Published var sortBy: SortBy = SortBy.asc
    @Published var searchString: String = ""

    private var subscriptions = Array<AnyCancellable>()
    
    init() {
        $text.sink { [weak self] _ in
            guard let self = self else { return }
            self.processText(sortBy: self.sortBy, searchString: self.searchString)
        }.store(in: &subscriptions)
        $sortBy.sink { [weak self] (sortBy: SortBy) in
            guard let self = self else { return }
            self.processText(sortBy: sortBy, searchString: self.searchString)
        }.store(in: &subscriptions)
        $searchString
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] searchString in
                guard let self = self else { return }
                self.processText(sortBy: self.sortBy, searchString: searchString)
            }.store(in: &subscriptions)
    }
    
    private func processText(sortBy: SortBy, searchString: String) {
        let wordIterator = WordIterator(text: text)
        var suffixes = [String: Int]()
        while let word = wordIterator.next() {
            let suffixSequence = SuffixSequence(word: word)
            for suffix in suffixSequence {
                if suffix.count >= 3 {
                    suffixes[suffix] = (suffixes[suffix] ?? 0) + 1
                }
            }
        }
        let suffixArray = suffixes.map { suffix, count in
            SuffixWithStats(suffix: suffix, count: count)
        }
        lexSortedSuffixes = suffixArray.sorted(by: { sortBy == .asc ? $0.suffix < $1.suffix : $0.suffix > $1.suffix })
        if !searchString.isEmpty {
            lexSortedSuffixes = lexSortedSuffixes?.filter { $0.suffix.starts(with: searchString) }
        }
        top10Suffixes = Array(suffixArray.filter { $0.suffix.count == 3 }.sorted { $0.count > $1.count }.prefix(10))
    }
}
