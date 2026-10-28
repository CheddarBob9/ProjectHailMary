//
//  RecipeDetailView.swift
//  HailMary
//
//  Created by Robert Montgomery on 10/27/26.
//

import SwiftUI
import SwiftData

struct RecipeDetailView: View {
	let recipe: Recipe          // the recipe that was tapped
    
    @State private var showEditing = false

	var body: some View {
		List {
			Section("Ingredients") {
				ForEach(recipe.ingredients, id: \.self) { ingredient in
					Text(ingredient)
				}
			}

			Section("Instructions") {
				ForEach(Array(recipe.instructions.enumerated()), id: \.offset) { index, step in
					HStack(alignment: .top) {
						Text("\(index + 1).").bold()
						Text(step)
					}
				}
			}

			if !recipe.notes.isEmpty {
				Section("Notes") {
					Text(recipe.notes)
				}
			}
		}
		.navigationTitle(recipe.title)
        
        .toolbar {
            Button("Edit") { showEditing = true }
        }
        .sheet(isPresented: $showEditing) {
            NewRecipeView(recipe: recipe, newRecipePresented: $showEditing)
        }
	}
}
