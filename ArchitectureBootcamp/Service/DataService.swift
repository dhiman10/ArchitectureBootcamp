//
//  DataService.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 14.09.25.
//

import Foundation
protocol DataService {
    func getProducts () async throws -> [Product]
}
struct MockDataService: DataService {
    func getProducts () async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        return products.products
    }

}
