import SwiftUI
import SwiftData

@available(iOS 17, *)
class FoodStore: ObservableObject{
    var smallFoods: [Food] = [
        Food(name: "Salmon", icon: "🐟", calories: 200, proteins: 22, fat: 12, carbohydrates: 0),
        Food(name: "Slice of Bread", icon: "🍞", calories: 80, proteins: 3, fat: 1, carbohydrates: 15),
        Food(name: "Sausage", icon: "🌭", calories: 250, proteins: 14, fat: 22, carbohydrates: 2),
        Food(name: "Chicken Breast", icon: "🍗", calories: 165, proteins: 31, fat: 3.6, carbohydrates: 0),
        Food(name: "Apple", icon: "🍎", calories: 95, proteins: 0.5, fat: 0.3, carbohydrates: 25),
        Food(name: "Banana", icon: "🍌", calories: 105, proteins: 1.3, fat: 0.3, carbohydrates: 27),
        Food(name: "Egg", icon: "🍳", calories: 68, proteins: 6, fat: 5, carbohydrates: 1),
        Food(name: "Cheese", icon: "🧀", calories: 113, proteins: 7, fat: 9, carbohydrates: 1),
        Food(name: "Carrot", icon: "🥕", calories: 25, proteins: 0.6, fat: 0.1, carbohydrates: 6),
        Food(name: "Tomato", icon: "🍅", calories: 22, proteins: 1, fat: 0.2, carbohydrates: 4.8),
        Food(name: "Cucumber", icon: "🥒", calories: 16, proteins: 0.7, fat: 0.1, carbohydrates: 3.6),
        Food(name: "Steak", icon: "🥩", calories: 242, proteins: 26, fat: 15, carbohydrates: 0),
        Food(name: "Potato", icon: "🥔", calories: 77, proteins: 2, fat: 0.1, carbohydrates: 17),
        Food(name: "Rice", icon: "🍚", calories: 206, proteins: 4.3, fat: 0.4, carbohydrates: 44.8),
        Food(name: "Pasta", icon: "🍝", calories: 221, proteins: 7, fat: 1.3, carbohydrates: 43.5),
        Food(name: "Avocado", icon: "🥑", calories: 160, proteins: 2, fat: 15, carbohydrates: 9),
        Food(name: "Spinach", icon: "🍃", calories: 7, proteins: 0.9, fat: 0.1, carbohydrates: 1.1),
        Food(name: "Pineapple", icon: "🍍", calories: 50, proteins: 0.5, fat: 0.1, carbohydrates: 13),
        Food(name: "Peach", icon: "🍑", calories: 59, proteins: 1, fat: 0.4, carbohydrates: 15),
        Food(name: "Mushroom", icon: "🍄", calories: 22, proteins: 3.1, fat: 0.3, carbohydrates: 3.3),
        Food(name: "Onion", icon: "🧅", calories: 40, proteins: 1.1, fat: 0.1, carbohydrates: 9.3)
    ]
}
