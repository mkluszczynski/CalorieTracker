//
//  MealStore.swift
//  CalorieTracker
//
//  Created by Mateusz Kluszczynski on 17/01/2025.
//

import SwiftUI

class MealStore: ObservableObject {
    
    @Published var meals: [Meal] = [
        Meal(name: "Śniadanie", foods: []),
        Meal(name: "Drugie śniadanie", foods: []),
        Meal(name: "Obiad", foods: []),
        Meal(name: "Kolacja", foods: [])
    ]
    
    func addFoodToMeal(mealName: String, food: Food) {
        if let index = meals.firstIndex(where: { $0.name == mealName }) {
            meals[index].addFood(food: food)
        }
    }
    
    func removeFoodFromMeal(mealName: String, food: Food){
        if let index = meals.firstIndex(where: { $0.name == mealName }) {
            meals[index].removeFoodById(id: food.id)
        }
    }
    
}
