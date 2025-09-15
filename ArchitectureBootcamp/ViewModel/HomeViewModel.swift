//
//  HomeViewModel.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 15.09.25.
//

import SwiftUI

@Observable
@MainActor
class HomeViewModel {
    let interactor: HomeViewModelInteractor

    var movies: [String] = []
    
    init(interactor: HomeViewModelInteractor) {
        self.interactor = interactor
    }
    
    func loadData() async {
        do {
            let _ = try await interactor.getUser()
            movies = try await interactor.getMovies()
        } catch {

        }
    }
}
