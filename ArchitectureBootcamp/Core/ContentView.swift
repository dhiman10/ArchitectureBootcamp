//
//  ContentView.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 13.09.25.
//

import SwiftUI
import CustomRouting

struct ContentView: View {
    let router: Router
    @State var viewModel: ContentViewModel

    var body: some View {
        VStack {
            ForEach(viewModel.products) { product in
                Text(product.title)
                    .onTapGesture {
                        router.showScreen(.push) { _ in
                            Text("Another Screen")
                            
                        }
                    }
            }
        }
        .navigationTitle("Content View")
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
    
    return RouterView { router in
        ContentView(
            router: router,
           viewModel: ContentViewModel(interactor: CoreInteractor(container: container))
       )

    }
    
}
