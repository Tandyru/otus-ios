//
//  Atomic.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 09.02.2025.
//

import Foundation

final class Atomic<Value> {
    private var value: Value
    private let lock = NSLock()

    init(_ value: Value) {
        self.value = value
    }

    func access<T>(_ keyPath: KeyPath<Value, T>) -> T {
        lock.lock()
        defer { lock.unlock() }
        return value[keyPath: keyPath]
    }

    func access<T>(_ accessing: (Value) throws -> T) rethrows -> T {
        lock.lock()
        defer { lock.unlock() }
        return try accessing(value)
    }

    func mutate(_ newValue: Value) {
        value = newValue
    }

    func mutate(_ mutation: (inout Value) throws -> Void) rethrows {
        lock.lock()
        defer { lock.unlock() }
        try mutation(&value)
    }
}
