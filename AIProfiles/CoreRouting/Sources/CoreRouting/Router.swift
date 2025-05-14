//
//  Router.swift
//  CoreRouting
//
//  Created by Andrey Tanakov on 14.05.2025.
//

import Combine
import SwiftUI

@MainActor
open class Router: ObservableObject {
    
    @Published public var path = NavigationPath()
    
    public init() {
    }
    
    @inlinable
    @inline(__always)
    public func push(_ appRoute: Route) {
        path.append(appRoute)
    }
    
    @inlinable
    @inline(__always)
    public func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    @inlinable
    @inline(__always)
    public func popToRoot() {
        path.removeLast(path.count)
    }
}
