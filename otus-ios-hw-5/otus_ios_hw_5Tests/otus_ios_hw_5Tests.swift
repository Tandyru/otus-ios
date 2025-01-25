//
//  otus_ios_hw_5Tests.swift
//  otus_ios_hw_5Tests
//
//  Created by Andrey Tanakov on 25.01.2025.
//

import Testing
@testable import otus_ios_hw_5

struct otus_ios_hw_5Tests {

    @Test func suffixSequenceTest() async throws {
        let word = "exploring"
        let expectedSuffixes = [
            "exploring",
            "xploring",
            "ploring",
            "loring",
            "oring",
            "ring",
            "ing",
            "ng",
            "g"
        ]
        
        let sequence = SuffixSequence(word: word)
        let suffixes = Array(sequence)
        
        #expect(suffixes.count == expectedSuffixes.count, "Suffix counts does not match")
        
        for (index, suffix) in suffixes.enumerated() {
            #expect(suffix == expectedSuffixes[index], "Suffix at index \(index) does not match")
        }
    }
    
    @Test func wordIteratorTest() async throws {
        let text = "Text word iterator... test."
        
        let iterator = WordIterator(text: text)
        
        #expect(iterator.next() == "Text")
        #expect(iterator.next() == "word")
        #expect(iterator.next() == "iterator")
        #expect(iterator.next() == "test")
        #expect(iterator.next() == nil)
    }
}
