//
//  NewRecipeView.swift
//  HailMary
//
//  Created by Emily Flowers on 10/4/26.
//

import SwiftUI

struct NewRecipeView: View {
    @StateObject var viewModel = NewRecipeViewViewModel()
    
    var body: some View {
        VStack {
            Text("New Recipe")
                .font(.system(size: 32))
                .bold()
                .padding()
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                
                // Ingredients
                TextField("Ingredients", text: $viewModel.ingredients)
                
                // Notes
                TextField("Notes", text: $viewModel.notes)
                
                // Save or Cancel
                HStack {
                    Button(action: viewModel.cancel) {
                        Text("Cancel")
                    }
                    Button(action: viewModel.save) {
                        Text("Save")
                    }
                    
                }
            }
        }
    }
}

#Preview {
    NewRecipeView()
}
