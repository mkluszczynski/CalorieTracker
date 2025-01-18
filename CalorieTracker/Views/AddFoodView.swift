import SwiftUI

struct AddFoodView: View {
    @EnvironmentObject var mealStore: MealStore
    @EnvironmentObject var foodStore: FoodStore
    @EnvironmentObject var nutritionStore: NutritionStore
    
    @State private var searchText: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var meal: Meal
    
    var filteredFoods: [Food] {
        guard !self.searchText.isEmpty else {
            return self.foodStore.smallFoods
        }
        return self.foodStore.smallFoods.filter{
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        VStack{
            AddedFoodListView(meal: meal)
            List(filteredFoods) { food in
                HStack {
                    Text("\(food.icon) \(food.name)")
                    Spacer()
                    Text("\(String(format: "%.0f", food.calories)) kcal")
                    Button(action: {
                        mealStore.addFoodToMeal(mealName: meal.name, food: food)
                        nutritionStore.addFoodNutritions(food: food)
                        dismiss()
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.blue)
                    }
                }
            }
            .searchable(text: $searchText,placement: .toolbar, prompt: "Wyszukaj potrawy")
        }
    }
}
