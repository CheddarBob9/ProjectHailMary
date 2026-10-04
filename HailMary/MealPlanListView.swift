//
//  MealPlanListView.swift
//  HailMary
//
//  Created by Emily Flowers on 10/4/26.
//

import SwiftUI

struct MealPlanListView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Meal Plans")
            .toolbar {
                Button {
                    // Action
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        
        
        
    }
}

#Preview {
    MealPlanListView()
}
