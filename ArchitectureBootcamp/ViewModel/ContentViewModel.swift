//
//  ContentViewModel.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 14.09.25.
//

import SwiftUI

@Observable
@MainActor
class ContentViewModel {
    let dataManager: DataManager
    let userManager: UserManager
    
    var products: [Product] = []
    
    init(container: DependencyContainer) {
        self.dataManager = container.resolve(DataManager.self)!
        self.userManager = container.resolve(UserManager.self)!
    }
    
    func loadData() async {
        do {
            products = try await dataManager.getProducts()
        } catch {
            
        }
    }
}
