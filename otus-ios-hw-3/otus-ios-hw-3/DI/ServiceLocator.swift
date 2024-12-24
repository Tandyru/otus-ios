//
//  ServiceLocator.swift
//  otus-ios-hw-3
//
//  Created by Andrey Tanakov on 24.12.2024.
//

final class ServiceLocator {
    static let shared = ServiceLocator()
    
    private var services: [String: Any] = [:]
    
    private init() {}
    
    func register<Service>(_ service: Service) {
        let key = String(describing: Service.self)
        services[key] = service
    }
    
    func resolve<Service>() -> Service? {
        let key = String(describing: Service.self)
        return services[key] as? Service
    }
    
    func resolveOrFail<Service>() -> Service {
        guard let service: Service = resolve() else {
            fatalError("\(Service.self) has not registred")
        }
        return service
    }
}

@propertyWrapper
struct Inject<Service> {
    private var service: Service
    
    init() {
        self.service = ServiceLocator.shared.resolveOrFail()
    }
    
    var wrappedValue: Service {
        get { service }
        mutating set { service = newValue }
    }
}
