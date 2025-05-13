//
//  ServiceLocator.swift
//  CoreUtils
//
//  Created by Andrey Tanakov on 13.05.2025.
//

@preconcurrency
public final class ServiceLocator {
    public static let shared = ServiceLocator()
    
    private var services: [String: Any] = [:]
    
    private init() {}
    
    public func register<Service>(_ service: Service) {
        let key = String(describing: Service.self)
        services[key] = service
    }
    
    public func resolve<Service>() -> Service? {
        let key = String(describing: Service.self)
        return services[key] as? Service
    }
    
    public func resolveOrFail<Service>() -> Service {
        guard let service: Service = resolve() else {
            fatalError("\(Service.self) has not registred")
        }
        return service
    }
}

@propertyWrapper
public struct Inject<Service> {
    private var service: Service
    
    public init() {
        self.service = ServiceLocator.shared.resolveOrFail()
    }
    
    public var wrappedValue: Service {
        get { service }
        mutating set { service = newValue }
    }
}
