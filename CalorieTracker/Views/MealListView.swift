import SwiftUI

@available(iOS 17, *)
struct MealListView: View {
    
    var meals: [Meal]
    
    var sortedMeals: [Meal] {
        meals.sorted { $0.order < $1.order }
    }

    var body: some View {
        List(sortedMeals) { meal in
            NavigationLink(value: meal) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(meal.name)
                        .font(.headline)

                    if meal.foods.isEmpty {
                        Text("No products added")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    } else {
                        ForEach(meal.foods) { food in
                            HStack {
                                Text(food.icon)
                                Text(food.name)
                                Spacer()
                                Text("\(food.calories.formatRounded(to: 0)) kcal")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .padding(.vertical, 5)
            }
        }
    }
}
