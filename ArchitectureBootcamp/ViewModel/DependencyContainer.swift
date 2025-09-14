//
//  DependencyContainer.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 14.09.25.
//

import Foundation

@MainActor
class DependencyContainer {
    private var services: [String: Any] = [:]
    
    func register<T>(_ type: T.Type, service: T) {
       let key = "\(type)"
       services[key] = service
    }
    
    func register<T>(_ type: T.Type, service: () -> T) {
        let key = "\(type)"
        services[key] = service()
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        let key = "\(type)"
        return services[key] as? T
    }
}
