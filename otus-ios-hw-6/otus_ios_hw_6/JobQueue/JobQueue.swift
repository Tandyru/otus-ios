//
//  JobQueue.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 08.02.2025.
//

import Combine

protocol JobQueue {
    var executedJob: AnyPublisher<any Job, Never> { get }
    func addJob(_ job: any Job)
    func executeNextJob() async -> Bool
}
