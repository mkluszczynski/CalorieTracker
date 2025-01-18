import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mealStore: MealStore
    @EnvironmentObject var foodStore: FoodStore
    @EnvironmentObject var nutritionStore: NutritionStore
    
//    @StateObject var addFoodViewModel = AddFoodViewModel()


    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Text("🍏 FitTracker")
                    .font(.largeTitle)
                    .padding()
                
                MealListView()
                NutritionGroupView()
            }
            .navigationDestination(for: Meal.self){ meal in
                AddFoodView(meal: meal)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(MealStore())
        .environmentObject(FoodStore())
        .environmentObject(NutritionStore())
}




