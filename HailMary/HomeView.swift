//
//  HomeView.swift
//  HailMary
//
//  Created by Emily Flowers on 10/4/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
            }
            .navigationTitle("Home")
            .toolbar {
                Button {
                    // Action
                } label: {
                    Image(systemName: "person")
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
