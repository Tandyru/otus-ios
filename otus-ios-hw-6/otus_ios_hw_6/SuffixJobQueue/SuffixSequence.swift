//
//  SuffixSequence.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 25.01.2025.
//

final class SuffixIterator: IteratorProtocol {
    private let word: String
    private var index: String.Index

    init(word: String) {
        self.word = word
        self.index = word.startIndex
    }
    
    func next() -> String? {
        guard index != word.endIndex else {
            return nil
        }
        let suffix = String(word[index...])
        index = word.index(after: index)
        return suffix
    }
}

struct SuffixSequence: Sequence {
    let word: String
    
    func makeIterator() -> SuffixIterator {
        return SuffixIterator(word: word)
    }
}
