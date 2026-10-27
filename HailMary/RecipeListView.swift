//
//  RecipeListView.swift
//  HailMary
//
//  Created by Emily Flowers on 10/4/26.
//

import SwiftUI
import SwiftData

struct RecipeListView: View {
    @StateObject var viewModel = RecipeListViewViewModel()
    @Query(sort: \Recipe.title) private var recipes: [Recipe]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipes) { recipe in
					NavigationLink {
						RecipeDetailView(recipe: recipe)
					} label: {
						VStack(alignment: .leading) {
							Text(recipe.title).font(.headline)
							if !recipe.notes.isEmpty {
								Text(recipe.notes).font(.subheadline).foregroundColor(.gray)
							}
						}
                    }
                }
                .onDelete(perform: deleteRecipe) // Trigger delete operation
                }
                .navigationTitle("Recipes")
                .toolbar {
                Button {
                    viewModel.showingNewRecipeView = true
                } label: {
                    Image(systemName: "plus")
                }
                }
                .sheet(isPresented: $viewModel.showingNewRecipeView) {
                            NewRecipeView(newRecipePresented: $viewModel.showingNewRecipeView)
                    }
            .navigationTitle("Recipes")
            .sheet(isPresented: $viewModel.showingNewRecipeView) {
                NewRecipeView(newRecipePresented:
                                $viewModel.showingNewRecipeView)
            }
        }
    }
    
    private func deleteRecipe(offsets: IndexSet) {
            for index in offsets {
                let recipeToDelete = recipes[index]
                modelContext.delete(recipeToDelete)
            }
        }
}

#Preview {
    RecipeListView()
}
