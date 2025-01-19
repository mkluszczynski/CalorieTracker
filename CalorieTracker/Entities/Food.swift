import SwiftUI
import SwiftData

@available(iOS 17, *)
@Model
class Food {
    var meals: [Meal] = []
    
    var name: String
    var icon: String
    var calories: Float
    let proteins: Float
    let fat: Float
    let carbohydrates: Float
    
    init(name: String, icon: String, calories: Float, proteins: Float, fat: Float, carbohydrates: Float) {
        self.name = name
        self.icon = icon
        self.calories = calories
        self.proteins = proteins
        self.fat = fat
        self.carbohydrates = carbohydrates
    }
}
