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
    
    private var recipeToEdit: Recipe?
    
    var isEditing: Bool { recipeToEdit != nil }
    
    // Allow for editing a recipe using existing data
    init(recipe: Recipe? = nil) {
        recipeToEdit = recipe
        if let recipe {
            title = recipe.title
            ingredients = recipe.ingredients.isEmpty ? [""] : recipe.ingredients
            instructions = recipe.instructions.isEmpty ? [""] : recipe.instructions
            notes = recipe.notes
        }
    }
    
    func save(modelContext: ModelContext) {
        // Convert multiline strings to arrays
        let cleanedIngredients = ingredients.map { $0.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }
        let cleanedInstructions = instructions.map { $0.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }
        
        // Either edit existing recipe or add new one
        if let recipe = recipeToEdit {
            // Edit existing
            recipe.title = title
            recipe.ingredients = cleanedIngredients
            recipe.instructions = cleanedInstructions
            recipe.notes = notes
        } else {
            // Create new Recipe object
            let newRecipe = Recipe(
                title: title,
                ingredients: cleanedIngredients,
                instructions: cleanedInstructions,
                notes: notes,
                image: ""
            )
            modelContext.insert(newRecipe)
        }
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
