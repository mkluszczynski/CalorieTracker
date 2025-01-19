import SwiftUI
import SwiftData

@available(iOS 17, *)
@Model
class Meal {
    var name: String
    var foods: [Food] = []
    var order: Int

    init(name: String, order: Int) {
        self.name = name
        self.order = order
        self.foods = []
    }
}
