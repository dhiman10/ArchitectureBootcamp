//
//  ArchitectureBootcampApp.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 13.09.25.
//

import SwiftUI

@main
struct ArchitectureBootcampApp: App {
    
    let container: DependencyContainer = {
        let c = DependencyContainer()
        c.register(DataManager.self, service: DataManager(service: MockDataService()))
        c.register(UserManager.self, service: UserManager())
        return c
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(interactor: ProductionContentViewModelInteractor(container: container)))
        }
    }
}
