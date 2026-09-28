//
//  ContentView.swift
//  HailMary
//
//  Created by Robert Montgomery on 9/28/26.
//

import SwiftUI

struct ContentView: View {
	
	var categories = ["Breakfast", "Soup & Salad", "Snacks & Sides", "Main Meals", "Sweet Treats", "Sauce is Boss"]
	
	var selected = "Breakfast"
	
    var body: some View {
		
		NavigationStack {
			
			VStack {
				
				Text("\(selected)")
					.font(.largeTitle.bold())
					.padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50))
					.background(
						RoundedRectangle(cornerRadius: 12)
							.fill(.white)
							.shadow(color: .green.opacity(0.7), radius: 6, x: 0, y: 0)
					)
				
				NavigationLink("Got to Breakfast") {
					Breakfast()
				}
				
				
				VStack {
					Circle()
						.fill(.green)
						.padding(50)
						.overlay(
							Image(systemName: "frying.pan.fill")
								.font(.system(size: 72))
								.foregroundColor(.white)
						)
						.background(
							Circle()
								.fill(.green.opacity(0.5))
								.padding(45)
						)
					
					Text("Pan Fried Chicken")
						.font(.title)
					
				} // Inner VStack
			} // Outer VStack
			.navigationTitle("Home")
		} // NavigationStack
    } // View
} // ContentView

struct ConstentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
