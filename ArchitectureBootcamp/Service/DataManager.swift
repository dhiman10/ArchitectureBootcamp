//
//  DataManager.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 14.09.25.
//

import SwiftUI

@Observable
@MainActor
class DataManager {
    let service: DataService
    
    init(service: DataService) {
        self.service = service
    }
    
    func getProducts() async throws -> [Product] {
        try await service.getProducts()
    }
    
    func getMovies() async throws -> [String] {
        ["Movies"]
    }
}

@Observable
@MainActor
class UserManager {
    func getUser() async throws -> String {
        ""
    }
}
