//
//  RecipeListView.swift
//  HailMary
//
//  Created by Emily Flowers on 10/4/26.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject var viewModel = RecipeListViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {                
            }
            .navigationTitle("Recipes")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewRecipeView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            .sheet(isPresented: $viewModel.showingNewRecipeView) {
                NewRecipeView()
            }
        }
    }
}

#Preview {
    RecipeListView()
}
