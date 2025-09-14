//
//  ProductArray.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 14.09.25.
//

import Foundation
import SwiftUI

struct ProductArray: Codable {
    let products: [Product]
}
struct Product: Codable, Identifiable {
    let id: Int
    let title : String
}
