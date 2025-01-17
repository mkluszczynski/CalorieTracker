import SwiftUI

struct NutritionGroupView: View {
    @EnvironmentObject var mealStore: MealStore

    var body: some View {
        HStack {
            ForEach(mealStore.nutritionSummary) { nutrition in
                NutritionView(name: nutrition.name, value: nutrition.value, target: nutrition.target)
            }
        }
        .padding(10)
    }
}

struct Nutrition: Identifiable {
    let id: UUID = UUID()
    let name: String
    let value: Int
    let target: Int
}
