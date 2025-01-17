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
                                Text("\(food.calories) kcal")
                                    .foregroundColor(.gray)
                            }
                        }
                    }

                    Text("Łączne kalorie: \(meal.foods.reduce(0) { $0 + $1.calories }) kcal")
                        .fontWeight(.thin)
                        .foregroundColor(.blue)
                }
                .padding(.vertical, 5)
            }
        }
        .navigationTitle("Twoje posiłki")
    }
}
