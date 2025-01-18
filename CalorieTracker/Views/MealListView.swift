import SwiftUI

struct MealListView: View {
    @EnvironmentObject var mealStore: MealStore

    var body: some View {
        List(mealStore.meals) { meal in
            NavigationLink(value: meal) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(meal.name)
                        .font(.headline)

                    if meal.foods.isEmpty {
                        Text("Brak składników")
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
