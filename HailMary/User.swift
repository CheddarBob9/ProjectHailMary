//
//  User.swift
//  HailMary
//
//  Created by Emily Flowers on 11/10/26.
//

import Foundation
import SwiftData

@Model
class User {
    // Attributes
    var username: String
    var email: String
    var recipeBook: RecipeBook
    
    // Constructor
    init(username: String, email: String, recipeBook: RecipeBook) {
        self.username = username
        self.email = email
        self.recipeBook = recipeBook
    }
}
