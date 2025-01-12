//
//  MealListView.swift
//  CalorieTracker
//
//  Created by Mateusz Kluszczynski on 12/01/2025.
//

import SwiftUI

struct MealListView: View {
   
    @EnvironmentObject var mealStore: MealStore
    @StateObject var addFoodViewModel = AddFoodViewModel()
    
    
    var body: some View {
        List(mealStore.meals) { meal in
            NavigationLink(value: meal){
                VStack(alignment: .leading, spacing: 10) {
                    Text(meal.name)
                        .font(.headline)
                    ForEach(meal.foods) { food in
                        HStack {
                            Text(food.icon)
                            Text(food.name)
                            Spacer()
                            Text("\(food.calories) kcal")
                                .foregroundColor(.gray)
                        }
                    }
                    Text("0 kalc").fontWeight(.thin)
                }
            }
        }
//        .sheet(isPresented: $addFoodViewModel.shouldShowAddFoodView, content: {
//            AddFoodView(meal: addFoodViewModel.selectedMeal)
//        })
    }
}
