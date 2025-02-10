//
//  TextSuffixesSaver.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 09.02.2025.
//

import Combine

final class TextSuffixesSaver {
    @Inject var jobScheduler: JobScheduler
    @Inject var textSuffixesStorage: TextSuffixesStorage
    
    private var suscriptions: Set<AnyCancellable> = []
    
    init() {
        jobScheduler.executedJob.sink { [weak self] job in
            if let textSuffixes = job.result as? TextSuffixes {
                Task {
                    await self?.textSuffixesStorage.save(textSuffixes: textSuffixes)
                }
            }
        }.store(in: &suscriptions)
    }
}
