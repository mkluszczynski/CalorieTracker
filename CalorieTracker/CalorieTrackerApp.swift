//
//  CalorieTrackerApp.swift
//  CalorieTracker
//
//  Created by Mateusz Kluszczynski on 09/01/2025.
//

import SwiftUI

@main
struct CalorieTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MealStore())
        }
    }
}
