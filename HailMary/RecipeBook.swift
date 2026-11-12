//
//  RecipeBook.swift
//  HailMary
//
//  Created by Emily Flowers on 11/10/26.
//

import Foundation
import SwiftData

@Model
class RecipeBook {
    // Attributes
    var title: String
    var recipe: [Recipe]?
    
    // Constructor
    init(title: String) {
        self.title = title
    }
}
