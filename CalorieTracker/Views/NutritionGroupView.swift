import SwiftUI

struct NutritionGroupView: View {
    @EnvironmentObject var nutritionStore: NutritionStore
    
    var body: some View {
        HStack {
            NutritionView(name: "Kalorie", nutrition: nutritionStore.calories)
            NutritionView(name: "Białko", nutrition: nutritionStore.proteins)
            NutritionView(name: "Tłuszcz", nutrition: nutritionStore.fat)
            NutritionView(name: "Węgle", nutrition: nutritionStore.carbohydrates)
        }
        .padding(10)
    }
}


