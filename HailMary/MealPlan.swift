//
//  MealPlan.swift
//  HailMary
//
//  Created by Emily Flowers on 11/10/26.
//


import Foundation
import SwiftData

@Model
class MealPlan {
    // Attributes
    var title: String
    var meal: [Meal]?
    
    // Constructor
    init(title: String) {
        self.title = title
    }
}
