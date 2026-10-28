//
//  NewRecipeView.swift
//  HailMary
//
//  Created by Emily Flowers on 10/4/26.
//

import SwiftUI
import SwiftData

struct NewRecipeView: View {
    @StateObject private var viewModel = NewRecipeViewViewModel()
    @Binding var newRecipePresented: Bool
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var name: String = ""
	
	enum Field: Hashable {
		case ingredient(Int)
		case step(Int)
	}
	
	@FocusState private var focusedField: Field?
    init(recipe: Recipe? = nil, newRecipePresented: Binding<Bool>) {
        _viewModel = StateObject(wrappedValue: NewRecipeViewViewModel(recipe: recipe))
        _newRecipePresented = newRecipePresented
    }
    
    var body: some View {
        NavigationStack {
            Form {
                // Title field
                TextField("Title", text: $viewModel.title)
                
                // Ingredients fields
                Section("Ingredients") {
                    ForEach(viewModel.ingredients.indices, id: \.self) { index in
                    TextField("Ingredient", text: $viewModel.ingredients[index])
							.focused($focusedField, equals: .ingredient(index))
                    }
                    .onDelete { offsets in viewModel.ingredients.remove(atOffsets: offsets)
                    }
                                    
                    Button {
                        viewModel.ingredients.append("")
						let newIndex = viewModel.ingredients.count - 1
						DispatchQueue.main.async {
							focusedField = .ingredient(newIndex)
						}
					} label: {
					Label("Add Ingredient", systemImage: "plus.circle")
					}
				}
                               
                // Instructions fields
                Section("Instructions") {
                    ForEach(viewModel.instructions.indices, id: \.self) { index in
                        TextField("Step", text: $viewModel.instructions[index])
							.focused($focusedField, equals: .step(index))
                        }
                        .onDelete { offsets in
                            viewModel.instructions.remove(atOffsets: offsets)
                        }
                                    
                    Button {
                        viewModel.instructions.append("")
						let newIndex = viewModel.instructions.count - 1
						DispatchQueue.main.async {
							focusedField = .step(newIndex)
						}
					} label: {
                    Label("Add Step", systemImage: "plus.circle")
					}
				}
                
                // Notes
                TextField("Notes", text: $viewModel.notes)
                
                // Add Photo
                Button("Add Photo") {} // Need to add functionality
            }
            // Title for screen editing or adding new
            .navigationTitle(viewModel.isEditing ? "Edit Recipe" : "Add New Recipe")
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
                        viewModel.save(modelContext: modelContext)
                        dismiss()
                    }
                    .disabled(!viewModel.canSave) // Save button disabled if title is blank
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
