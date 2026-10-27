//
//  NewRecipeViewViewModel.swift
//  HailMary
//
//  Created by Emily Flowers on 10/4/26.
//

import Foundation
import SwiftData
public import Combine

class NewRecipeViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var ingredients = [""]
    @Published var instructions = [""]
    @Published var notes = ""
    @Published var showAlert = false
    
    init() {}
    
    func save(modelContext: ModelContext) {
        // Convert multiline strings to arrays
        let cleanedIngredients = ingredients.map { $0.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }
                let cleanedInstructions = instructions.map { $0.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }
                
        // Create the Recipe object
        let newRecipe = Recipe(
                    title: title,
                    ingredients: cleanedIngredients,
                    instructions: cleanedInstructions,
                    notes: notes,
                    image: ""
                )
                modelContext.insert(newRecipe)
            
    }
    
    // Check if title is not empty
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        return true
    }
    
    func cancel() {
    }
}
