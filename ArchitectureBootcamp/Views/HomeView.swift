//
//  HomeView.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 15.09.25.
//

import SwiftUI

struct HomeView: View {
    
    @State var viewModel: HomeViewModel

    var body: some View {
        VStack {
            ForEach(viewModel.movies, id: \.self) { movie in
                Text(movie)
                    .foregroundStyle(.green)
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

        return HomeView(
            viewModel: HomeViewModel(interactor: CoreInteractor(container: container))
        )
    
}
