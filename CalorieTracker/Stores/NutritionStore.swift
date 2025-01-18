//
//  NutritionStore.swift
//  CalorieTracker
//
//  Created by Mateusz Kluszczynski on 17/01/2025.
//

import SwiftUI

class NutritionStore: ObservableObject {
    
    @Published var calories: Nutrition = Nutrition(value: 0, target: 2100)
    @Published var proteins: Nutrition = Nutrition(value: 0, target: 150)
    @Published var fat: Nutrition = Nutrition(value: 0, target: 70)
    @Published var carbohydrates: Nutrition = Nutrition(value: 0, target: 250)
    
    func addFoodNutritions(food: Food){
        calories.value += food.calories
        proteins.value += food.proteins
        fat.value += food.fat
        carbohydrates.value += food.carbohydrates
    }
    
    func removeFoodNutrition(food: Food) {
        calories.value -= food.calories
        proteins.value -= food.proteins
        fat.value -= food.fat
        carbohydrates.value -= food.carbohydrates
    }
    
}
