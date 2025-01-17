import SwiftUI

import SwiftUI

struct AddFoodView: View {
    @EnvironmentObject var mealStore: MealStore
    @State private var searchText: String = ""
    var meal: Meal

    private func addFoodToMeal(food: Food) {
        guard let index = mealStore.meals.firstIndex(where: { $0.id == meal.id }),
              !mealStore.meals[index].foods.contains(where: { $0.id == food.id }) else {
            return
        }
        mealStore.meals[index].foods.append(food)
    }

    private func removeFoodFromMeal(food: Food) {
        guard let index = mealStore.meals.firstIndex(where: { $0.id == meal.id }) else { return }
        mealStore.meals[index].foods.removeAll { $0.id == food.id }
    }

    var body: some View {
        VStack {
            Text("Dodaj produkt do: \(meal.name)")
                .font(.title2)
                .padding()

            TextField("Wyszukaj produkt", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            List(mealStore.availableFoods.filter {
                searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
            }) { food in
                HStack {
                    Text("\(food.icon) \(food.name)")
                    Spacer()
                    Text("\(food.calories) kcal")
                    Button(action: {
                        addFoodToMeal(food: food)
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.blue)
                    }
                }
            }

            Text("Łączne kalorie: \(meal.foods.reduce(0) { $0 + $1.calories }) kcal")
                .padding()

            Section(header: Text("Produkty w posiłku")) {
                List {
                    ForEach(meal.foods, id: \.id) { food in
                        HStack {
                            Text("\(food.icon) \(food.name)")
                            Spacer()
                            Text("\(food.calories) kcal")
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                removeFoodFromMeal(food: food)
                            } label: {
                                Label("Usuń", systemImage: "trash")
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Dodaj produkt", displayMode: .inline)
        }
        .padding()
    }
}

class AddFoodViewModel: ObservableObject {
    @Published var shouldShowAddFoodView: Bool = false

    var selectedMeal: Meal = Meal(name: "", foods: []) {
        didSet {
            self.shouldShowAddFoodView = true
        }
    }
}

struct AddFoodViewPreview: View {
    @EnvironmentObject var mealStore: MealStore
    @StateObject var addFoodViewModel = AddFoodViewModel()

    var body: some View {
        AddFoodView(meal: addFoodViewModel.selectedMeal)
            .onAppear {
                if let firstMeal = mealStore.meals.first {
                    addFoodViewModel.selectedMeal = firstMeal
                } else {
                    addFoodViewModel.selectedMeal = Meal(name: "Brak danych", foods: [])
                }
            }
    }
}

#Preview {
    AddFoodViewPreview()
        .environmentObject(MealStore())
}
