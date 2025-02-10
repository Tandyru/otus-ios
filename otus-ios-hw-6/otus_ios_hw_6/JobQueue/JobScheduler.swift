//
//  JobScheduler.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 08.02.2025.
//

import Foundation
import Combine

final class JobScheduler {
    
    var executedJob: AnyPublisher<any Job, Never> {
        queue.executedJob
    }
    
    private let queue = JobQueueImpl()
    private var timer = Timer()
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: true) { [weak self] _ in
            Task {
                guard let self = self else { return }
                while(await self.queue.executeNextJob()) {}
            }
        }
    }
    
    func schedule(_ job: any Job) {
        queue.addJob(job)
    }
}
