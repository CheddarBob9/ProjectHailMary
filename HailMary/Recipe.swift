//
//  Recipe.swift
//  HailMary
//
//  Created by Emily Flowers on 10/18/26.
//

import Foundation
import SwiftData

@Model
class Recipe {
    // Attributes
    var title: String
    var ingredients: [String]
    var instructions: [String]
    var notes: String
    var image: String
    
    // Constructor
    init(title: String, ingredients: [String], instructions: [String], notes: String, image: String) {
        self.title = title
        self.ingredients = ingredients
        self.instructions = instructions
        self.notes = notes
        self.image = image
    }
}
