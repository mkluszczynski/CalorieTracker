//
//  Meal.swift
//  CalorieTracker
//
//  Created by Mateusz Kluszczynski on 17/01/2025.
//

import SwiftUI

struct Meal: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    var foods: [Food]
    
    mutating func addFood(food: Food) {
        self.foods.append(food)
    }
    
    mutating func removeFoodByName(name: String) {
        self.foods.removeAll { $0.name == name }
    }
    
    mutating func removeFoodById(id: UUID){
        self.foods.removeAll { $0.id == id}
        
    }
}
