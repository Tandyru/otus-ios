//
//  Store.swift
//  AIProfiles
//
//  Created by Andrey Tanakov on 25.04.2025.
//

import Foundation
import Combine

public final class Store<State, Action>: @unchecked Sendable {

    public var state: AnyPublisher<State, Never> {
        stateSubject.eraseToAnyPublisher()
    }
    
    public typealias Middleware = (_ action: Action, _ state: State, _ dispatch: @escaping @MainActor (Action) -> State?) -> Void
    public typealias Reducer = (_ state: State, _ action: Action) -> State
    
    private let stateSubject: CurrentValueSubject<State, Never>
    private let reducer: Reducer
    private let middleware: Middleware
    private var stateValue: State {
        stateSubject.value
    }

    public init(initialState: State, reducer: @escaping Reducer, middleware: @escaping Middleware) {
        self.reducer = reducer
        self.middleware = middleware
        stateSubject = CurrentValueSubject<State, Never>(initialState)
    }
    
    public func dispatch(action: Action) {
        assert(Thread.isMainThread)
        middleware(action, stateValue) { [weak self] newAction in
            assert(Thread.isMainThread)
            self?.dispatch(action: newAction)
            return self?.stateValue
        }
        let newState = reducer(stateSubject.value, action)
        stateSubject.send(newState)
    }
}
