import SwiftUI
import SwiftData

@available(iOS 17, *)
struct AddFoodView: View {
    @EnvironmentObject var foodStore: FoodStore
    
    @State private var searchText: String = ""
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    var meal: Meal
    
    var foods: [Food] {
        foodStore.smallFoods
    }
    
    var filteredFoods: [Food] {
        guard !self.searchText.isEmpty else {
            return foods}
        return foods.filter{
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
                        addFoodToMeal(meal: meal, food: food)
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
    
    func addFoodToMeal(meal: Meal, food: Food){
        meal.foods.append(food)
    }
}
