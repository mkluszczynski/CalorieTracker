//
//  AddFoodView.swift
//  CalorieTracker
//
//  Created by Mateusz Kluszczynski on 12/01/2025.
//

import SwiftUI

struct AddFoodView: View {
    var meal: Meal
    
    var body: some View {
        VStack{
            Text(meal.name)
        }
    }
}

class AddFoodViewModel: ObservableObject {
    @Published var shouldShowAddFoodView: Bool = false;
    
    var selectedMeal: Meal = Meal(name: "", foods: []) {
        didSet {
            self.shouldShowAddFoodView = true;
        }
    }
    
}

struct AddFoodViewPreview: View {
    
    @EnvironmentObject var mealStore: MealStore
    @StateObject var addFoodViewModel = AddFoodViewModel()
    
    var body: some View{
        AddFoodView(meal: addFoodViewModel.selectedMeal)
            .onAppear(){
                addFoodViewModel.selectedMeal = mealStore.meals.first ?? Meal(name: "Error", foods: [])
            }
    }
}

#Preview {
    AddFoodViewPreview()
        .environmentObject(MealStore())
}
