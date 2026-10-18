//
//  HailMaryApp.swift
//  HailMary
//
//  Created by Robert Montgomery on 9/28/26.
//

import SwiftUI
import SwiftData

@main
struct HailMaryApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Recipe.self)
    }
}
