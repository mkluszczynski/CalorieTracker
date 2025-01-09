//
//  ContentView.swift
//  CalorieTracker
//
//  Created by Mateusz Kluszczynski on 09/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var mealStore: MealStore
    
    var body: some View {
        List(mealStore.meals) { meal in
            VStack(alignment: .leading) {
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
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(MealStore())
}
        
class MealStore: ObservableObject{
    @Published var appName = "Fitapp"
    @Published var meals: [Meal] = [
        Meal(name: "Śnadanie", foods: [Food(name: "Egg", icon: "🥚", calories: 80, proteins: 6, fat: 5, carbohydrates: 1)]),
        Meal(name: "Drugie śniadanie", foods: []),
        Meal(name: "Obiad", foods: []),
        Meal(name: "Kolacja", foods: [])
    ]
}

struct Food: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let icon: String
    let calories: Int
    let proteins: Int
    let fat: Int
    let carbohydrates: Int
}

struct Meal: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let foods: [Food]
}
