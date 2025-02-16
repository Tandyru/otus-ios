//
//  SerialJobQueue.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 09.02.2025.
//

import Foundation
import Combine

final class JobQueueImpl {
    private var jobs: [any Job] = []
    private let lock = NSLock()
    private let executedJobSubject = PassthroughSubject<any Job, Never>()
}

extension JobQueueImpl: JobQueue {
    var executedJob: AnyPublisher<any Job, Never> {
        executedJobSubject.eraseToAnyPublisher()
    }
    
    func addJob(_ job: any Job) {
        lock.withLock {
            jobs.append(job)
        }
    }
    
    func executeNextJob() async -> Bool {
        let job: (any Job)? = lock.withLock {
            if jobs.isEmpty {
                return nil
            }
            return self.jobs.removeFirst()
        }
        guard let job = job else {
            return false
        }
        await job.execute()
        lock.withLock {
            self.executedJobSubject.send(job)
        }
        return true
    }
    
    
}
