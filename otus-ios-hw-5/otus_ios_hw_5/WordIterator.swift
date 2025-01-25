//
//  WordSequence.swift
//  otus-ios-hw-5
//
//  Created by Andrey Tanakov on 25.01.2025.
//


final class WordIterator: IteratorProtocol {
    private let text: String
    private var currentRange: Range<String.Index>
    private var isFinished = false
    
    init(text: String) {
        self.text = text
        self.currentRange = text.startIndex..<text.endIndex
    }
    
    func next() -> String? {
        guard !isFinished else { return nil }
        
        var word: String? = nil
        text.enumerateSubstrings(in: currentRange, options: [.byWords]) { substring, range, _, stop in
            word = substring
            self.currentRange = range.upperBound..<self.text.endIndex
            stop = true
        }
        
        if word == nil { isFinished = true }
        return word
    }
}
