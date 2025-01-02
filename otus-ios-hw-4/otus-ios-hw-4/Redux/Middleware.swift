//
//  Middleware.swift
//  otus-ios-hw-4
//
//  Created by Andrey Tanakov on 31.12.2024.
//

protocol Middleware {
    func execute(actoin: Action, state: State, dispatch: @escaping (Action) -> State?)
}

