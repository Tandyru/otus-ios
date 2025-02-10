//
//  SuffixJob.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 08.02.2025.
//


final class SuffixJob: Job {
        
    private(set) var result: TextSuffixes?
    
    private let text: String
    
    init(text: String) {
        self.text = text
    }
    
    func execute() async {
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
            Suffix(suffix: suffix, count: count)
        }
        result = .init(text: text, suffixes: suffixArray)
    }
}
