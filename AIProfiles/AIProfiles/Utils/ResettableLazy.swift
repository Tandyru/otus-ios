//
//  ResettableLazy.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

struct ResettableLazy<Value> {
    private var _value: Value?
    private let create: () -> Value
    
    init(create: @escaping () -> Value) {
        self.create = create
    }
    
    var value: Value {
        mutating get {
            if let existingValue = _value {
                return existingValue
            }
            let newValue = create()
            _value = newValue
            return newValue
        }
    }
    
    mutating func reset() {
        _value = nil
    }
}
