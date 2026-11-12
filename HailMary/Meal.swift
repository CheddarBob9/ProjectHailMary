//
//  Meal.swift
//  HailMary
//
//  Created by Emily Flowers on 11/10/26.
//


import Foundation
import SwiftData

@Model
class Meal {
    // Attributes
    var title: String
    var assignedRecipe: [Recipe]?
    
    // Constructor
    init(title: String) {
        self.title = title
    }
}
