//
//  AddedFoodListView.swift
//  CalorieTracker
//
//  Created by Mateusz Kluszczynski on 17/01/2025.
//

import SwiftUI

struct AddedFoodListView: View {
    @EnvironmentObject var mealStore: MealStore
    @EnvironmentObject var nutritionStore: NutritionStore
    
    @Environment(\.dismiss) var dismiss
    
    var meal: Meal
    
    var body: some View {
        VStack{
            if meal.foods.isEmpty {
                            Text("No food added")
                                .foregroundColor(.gray)
                                .italic()
                                .padding()
            } else {
                ForEach(meal.foods) { food in
                    HStack(alignment: .firstTextBaseline) {
                        Text("\(food.icon) \(food.name)")
                        Spacer()
                        Text("\(String(format: "%.0f", food.calories)) kcal")
                        Button(action: {
                            //                    mealStore.addFoodToMeal(mealName: meal.name, food: food)
                            nutritionStore.removeFoodNutrition(food: food)
                            mealStore.removeFoodFromMeal(mealName: meal.name, food: food)
                            dismiss()
                        }) {
                            Image(systemName: "minus.circle")
                                .foregroundColor(.red)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                }
                
            }
        }
    }
}

