//
//  Atomic.swift
//  otus-ios-hw-6
//
//  Created by Andrey Tanakov on 09.02.2025.
//

import os.lock

@propertyWrapper
public struct Atomic<Value>: Sendable where Value: Sendable {

    private let lock: OSAllocatedUnfairLock<Value>

    public init(wrappedValue value: Value) {
        self.lock = OSAllocatedUnfairLock(initialState: value)
    }

    public var wrappedValue: Value {
        get { lock.withLock { $0 } }
        set { lock.withLock { $0 = newValue } }
    }
}
