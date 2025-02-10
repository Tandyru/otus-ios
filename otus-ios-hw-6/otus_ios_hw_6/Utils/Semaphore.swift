//
//  Semaphore.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 09.02.2025.
//

actor Semaphore {
    private var capacity: Int {
        didSet {
            assert(capacity >= 0)
        }
    }
    struct Waiter {
        var continuation: CheckedContinuation<Void, Never>
    }
    private var waiters: [Waiter] = []

    init(capacity: Int = 0) {
        self.capacity = capacity
    }

    func wait() async {
        if capacity > 0 {
            capacity -= 1
        } else {
            await withCheckedContinuation { waiters.append(.init(continuation: $0)) }
        }
    }

    func signal() {
        if waiters.isEmpty {
            capacity += 1
        } else {
            waiters.removeFirst().continuation.resume()
        }
    }
    
    func withCriticalSection<Result>(_ runCriticalSection: () async -> Result) async -> Result {
        await wait()
        defer { signal() }
        return await runCriticalSection()
    }
}
