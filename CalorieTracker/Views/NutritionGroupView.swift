import SwiftUI

@available(iOS 17, *)
struct NutritionGroupView: View {
    
    var meals: [Meal]
    
    var body: some View {
        HStack {
            NutritionView(name: "Kalorie", nutrition: Nutrition(value: getCalories(), target: 2100))
            NutritionView(name: "Białko", nutrition: Nutrition(value: getProteins(), target: 100))
            NutritionView(name: "Tłuszcz", nutrition: Nutrition(value: getFat(), target: 70))
            NutritionView(name: "Węgle", nutrition: Nutrition(value: getCalories(), target: 369))
        }
        .padding(10)
    }
    
    func getCalories() -> Float{
        let totalCalories = meals.reduce(0) { total, meal in
            total + meal.foods.reduce(0) { mealTotal, food in
                mealTotal + food.calories
            }
        }
        return totalCalories
    }
    
    func getProteins() -> Float{
        let totalCalories = meals.reduce(0) { total, meal in
            total + meal.foods.reduce(0) { mealTotal, food in
                mealTotal + food.proteins
            }
        }
        return totalCalories
    }
    
    func getFat() -> Float{
        let totalCalories = meals.reduce(0) { total, meal in
            total + meal.foods.reduce(0) { mealTotal, food in
                mealTotal + food.fat
            }
        }
        return totalCalories
    }
    
    func getCarbohydrates() -> Float{
        let totalCalories = meals.reduce(0) { total, meal in
            total + meal.foods.reduce(0) { mealTotal, food in
                mealTotal + food.carbohydrates
            }
        }
        return totalCalories
    }
}


