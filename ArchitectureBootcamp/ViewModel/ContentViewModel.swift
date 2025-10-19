//
//  ContentViewModel.swift
//  ArchitectureBootcamp
//
//  Created by Dhiman Das on 14.09.25.
//

/*
 ARCHITECTURE NOTES
 
 1. No Architecture (Vanilla SwiftUI)
 
 - There is no DataManager, Views are responsible for business logic & data logic
 - View holds the array of products
 
Pros:
 - Simplest code
 - Easy to set up, low change for bugs
 
Cons:
 - No seperation between View and Data layers
 - Not testable, mockable, or reusable
 
 
 2. MV Architecture (Vanilla SwiftUI)
 
 - DataManager is shared across the app
 - DataManager is responsible for business logic and data logic
 
 Pros:
 - Less code
 - Easy to reuse business logic
 
 Cons:
 - Tightly coupled the business logic to the data logic
 - "Too easy" to reuse data (other View's can affect each other)
 - DataManager is semi-testable
 
 3. MVC Architecture (Vanilla SwiftUI)
 
 - DataManager is shared across the app
 - Views are responsible for business logic but not data logic
 - View holds the array of products
 
 Pros:
 - DataManager is shared across the application
 - DataManager is testable, mockable, & reusable
 
 Cons:
 - Business logic is not testable
 - Massive View Controller problem
 
 
 4. MVVM Architecture
 
 - DataManager is shared across the app, but access from the ViewModel
 - ViewModels are responsible for business logic
 - ViewModel holds the array of products
 
 Pros:
 - Seperated the View from the business logic
 - Business logic is now testable
 - View code is much cleaner

 Cons:
 - More difficult to set up and inject dependencies
 - ViewModel lifecycle is outside of View lifecycle (cannot use SwiftUI Property Wrappers)
 
 5. MVVM Architecture + DI Container
 
 Pros:
 - Same as MVVM above, but much easier to manage dependencies
 
 Cons:
 - Adds abstraction to the dependencies (ie. app will crash if dependency is not there)
 
 
 6. MVVM Architecure + Protocols (Interactors)
 
 Pros:
 - Same as MVVM above, but full decouples the dependencies from ViewModel
 - Easiesr to test!
 
 Cons:
 - More work to set up and maintain
 
 6. MVVM Architecure + Protocols (Interactors)
 
 Pros:
 - Same as MVVM above, but full decouples the dependencies from ViewModel
 - Easiesr to test!
 
 Cons:
 - More work to set up and maintain
 
 7. MVVM Architecture + Protocols + Shared Conformance (CoreInteractor)
 
 Pros:
 - Same as #5 above, but easier to setup and maintain
 
 Cons:
 - Single large interactor per module
 
 8. MVVM Architecture + Protocols + Shared Conformance + Builder (CoreBuilder)
 
 Pros:
 - Same as #6 above
 - Decoupled routing destinations between views
 - Removed the SwiftUI Environment entirely
 
 Cons:
 - More work to set up and maintain
 
 */




import SwiftUI

@Observable
@MainActor
class ContentViewModel {

    let interactor: ContentViewModelInteractor
    var products: [Product] = []
    
    init(interactor: ContentViewModelInteractor) {
        self.interactor = interactor
    }
    
    func loadData() async {
        do {
            products = try await interactor.getProducts()
        } catch {
            
        }
    }
}
