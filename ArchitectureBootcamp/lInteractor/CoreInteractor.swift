//
//  ProductionContentViewModelInteractor.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 14.09.25.
//


protocol ContentViewModelInteractor {
    func getProducts() async throws -> [Product]
    func getUser() async throws -> String
}
extension CoreInteractor: ContentViewModelInteractor { }

protocol HomeViewModelInteractor {
    func getMovies() async throws -> [String]
    func getUser() async throws -> String
}
extension CoreInteractor: HomeViewModelInteractor { }

protocol SettingsViewModelInteractor {
    func getUser() async throws -> String
    func getMovies() async throws -> [String]
}
extension CoreInteractor: SettingsViewModelInteractor { }

@MainActor
struct CoreInteractor {
    
    let dataManager: DataManager
    let userManager: UserManager
    
    init(container: DependencyContainer) {
        self.dataManager = container.resolve(DataManager.self)!
        self.userManager = container.resolve(UserManager.self)!
    }
    
    func getProducts() async throws -> [Product] {
        try await dataManager.getProducts()
    }
    
    func getMovies() async throws -> [String] {
        try await dataManager.getMovies()
    }
    
    func getUser() async throws -> String {
        try await userManager.getUser()
    }
}

