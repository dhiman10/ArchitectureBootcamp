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

@MainActor
struct ProductionContentViewModelInteractor: ContentViewModelInteractor {
    
    let dataManager: DataManager
    let userManager: UserManager
    
    init(container: DependencyContainer) {
        self.dataManager = container.resolve(DataManager.self)!
        self.userManager = container.resolve(UserManager.self)!
    }
    
    func getProducts() async throws -> [Product] {
        try await dataManager.getProducts()
    }
    
    func getUser() async throws -> String {
        try await userManager.getUser()
    }
    
}

@MainActor
struct MockContentViewModelInteractor: ContentViewModelInteractor {
    
    func getProducts() async throws -> [Product] {
        [
            Product(id: 1, title: "This is my first product!")
        ]
    }
    
    func getUser() async throws -> String {
        ""
    }
}
