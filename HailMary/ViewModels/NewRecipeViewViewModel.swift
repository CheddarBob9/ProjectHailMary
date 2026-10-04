//
//  NewRecipeViewViewModel.swift
//  HailMary
//
//  Created by Emily Flowers on 10/4/26.
//

import Foundation
public import Combine

class NewRecipeViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var ingredients = ""
    @Published var notes = ""
    
    init() {}
    
    func save() {
        
    }
    
    func cancel() {
        
    }
}
