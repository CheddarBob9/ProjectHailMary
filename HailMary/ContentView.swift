//
//  ContentView.swift
//  HailMary
//
//  Created by Robert Montgomery on 9/28/26.
//

import SwiftUI

struct ContentView: View {
    
    var categories = ["Breakfast", "Soup & Salad", "Snacks & Sides", "Main Meals", "Sauce is Boss", "Sweet Treats", "All Recipes"]
    
    var body: some View {
        
        VStack(spacing: 12) {
            ForEach(categories, id: \.self) { category in
                Button { print(category) } label: {
                    Text(category).frame(width: 200)
                }
                .buttonStyle(.borderedProminent)
            }
        } // VStack
        
        
    }
    // View
} // ContentView

struct ConstentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
