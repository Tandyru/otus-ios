//
//  Store.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 31.12.2024.
//

import Foundation
import Combine

final class Store {
    var state: AnyPublisher<State, Never> {
        stateSubject.eraseToAnyPublisher()
    }
    
    private let stateSubject: CurrentValueSubject<State, Never>
    private let reducer: Reducer
    private let middleware: Middleware
    private var stateValue: State {
        stateSubject.value
    }

    init(initialState: State, reducer: Reducer, middleware: Middleware) {
        self.reducer = reducer
        self.middleware = middleware
        stateSubject = CurrentValueSubject<State, Never>(initialState)
    }
    
    func dispatch(action: Action) {
        middleware.execute(actoin: action, state: stateValue) { [weak self] newAction in
            self?.dispatch(action: newAction)
            return self?.stateValue
        }
        let newState = reducer.reduce(state: stateSubject.value, action: action)
        stateSubject.send(newState)
    }
}
