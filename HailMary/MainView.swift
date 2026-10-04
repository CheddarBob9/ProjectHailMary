//
//  MainView.swift
//  HailMary
//
//  Created by Emily Flowers on 10/4/26.
//

import SwiftUI

struct MainView: View {
   // @StateObject var viewModel = MainViewViewModel()
    
    var body : some View {
        // Navigation bar at bottom of screen
        TabView {
            // Home Screen Tab
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            // Recipe Screen Tab
            RecipeListView()
                .tabItem {
                    Label("Recipes", systemImage: "fork.knife")
                }
            
            // Meal Plan Screen Tab
            MealPlanListView()
                .tabItem {
                    Label("Meal Plans", systemImage: "calendar")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
