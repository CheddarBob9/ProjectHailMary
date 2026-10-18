//
//  NewRecipeView.swift
//  HailMary
//
//  Created by Emily Flowers on 10/4/26.
//

import SwiftUI

struct NewRecipeView: View {
    @StateObject var viewModel = NewRecipeViewViewModel()
    @Binding var newRecipePresented: Bool
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                
                // Ingredients
                TextField("Ingredients", text: $viewModel.ingredients)
                
                // Notes
                TextField("Notes", text: $viewModel.notes)
            }
            // Title for screen
            .navigationTitle("Add New Recipe")
            // Buttons at top for cancel or save
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        // Discard changes and dismiss
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        // Call save method and dismiss Add Recipe popup
                        viewModel.save()
                        dismiss()
                    }
                    .disabled(!viewModel.canSave) // Save button disabled if title and ingredients are blank
                }
            }
        }
    }
}

#Preview {
    NewRecipeView(newRecipePresented: Binding(get: {
        return true
    }, set: { _ in
    }))
}
