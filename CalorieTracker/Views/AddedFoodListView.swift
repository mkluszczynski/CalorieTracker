import SwiftUI

@available(iOS 17, *)
struct AddedFoodListView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var meal: Meal
    
    var body: some View {
        VStack{
            if meal.foods.isEmpty {
                            Text("No products added")
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
                            removeFoodFromMeal(meal: meal, food: food)
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
    
    func removeFoodFromMeal(meal: Meal, food: Food) {
        if let foodIndex = meal.foods.firstIndex(where: { $0.id == food.id }) {
            meal.foods.remove(at: foodIndex)
        }
    }
}

