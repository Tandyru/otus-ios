//
//  ViewModel.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 25.01.2025.
//

import Foundation
import Combine

final class SuffixesViewModel: ObservableObject {
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

    @Inject var sharedText: SharedText
    @Inject var textSuffixesStorage: TextSuffixesStorage
    @Inject var jobScheduler: JobScheduler
    private var subscriptions = Array<AnyCancellable>()
    private var lastProcessedText: String? = nil
    
    init() {
        $text
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] text in
                guard let self = self else { return }
                self.processText(text: text, sortBy: self.sortBy, searchString: self.searchString)
            }.store(in: &subscriptions)
        $sortBy.sink { [weak self] (sortBy: SortBy) in
            guard let self = self else { return }
            self.processText(text: text, sortBy: sortBy, searchString: self.searchString)
        }.store(in: &subscriptions)
        $searchString
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] searchString in
                guard let self = self else { return }
                self.processText(text: text, sortBy: self.sortBy, searchString: searchString)
            }.store(in: &subscriptions)
        sharedText.$text.sink { [weak self] text in
            if !text.isEmpty {
                self?.text = text
            }
        }.store(in: &subscriptions)
        jobScheduler.executedJob.sink { [weak self] job in
            self?.checkJobResult(job)
        }.store(in: &subscriptions)
    }
    
    private func processText(text: String, sortBy: SortBy, searchString: String) {
        guard lastProcessedText != text, !text.isEmpty else {
            return
        }
        lastProcessedText = text
        let job = SuffixJob(text: text)
        jobScheduler.schedule(job)
    }
    
    private func checkJobResult(_ job: any Job) {
        if let result = job.result as? TextSuffixes {
            DispatchQueue.main.async {
                guard self.text == result.text else {
                    return
                }
                self.showSuffixes(result.suffixes)
            }
        }
    }
    
    private func showSuffixes(_ suffixes: [Suffix]) {
        let suffixArray = suffixes.map {
            SuffixWithStats(suffix: $0.suffix, count: $0.count)
        }
        self.lexSortedSuffixes = suffixArray.sorted(by: { sortBy == .asc ? $0.suffix < $1.suffix : $0.suffix > $1.suffix })
        if !searchString.isEmpty {
            lexSortedSuffixes = lexSortedSuffixes?.filter { $0.suffix.starts(with: searchString) }
        }
        top10Suffixes = Array(suffixArray.filter { $0.suffix.count == 3 }.sorted { $0.count > $1.count }.prefix(10))
    }
}
