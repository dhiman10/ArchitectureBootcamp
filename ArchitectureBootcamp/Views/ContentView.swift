//
//  ContentView.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 13.09.25.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.products) { product in
                Text(product.title)
            }
        }
        .padding()
        .task {
            await viewModel.loadData()
        }
    }
}

#Preview {
    let container = DependencyContainer()
    container.register(DataManager.self, service: DataManager(service: MockDataService()))
    container.register(UserManager.self, service: UserManager())

    return ContentView(viewModel: ContentViewModel(container: container))
    
}
