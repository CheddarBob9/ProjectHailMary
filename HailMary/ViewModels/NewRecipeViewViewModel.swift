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
    @Published var instructions = ""
    @Published var notes = ""
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        
    }
    
    // Check if title and ingredients is not empty
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !ingredients.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
    
    func cancel() {
        
    }
}
