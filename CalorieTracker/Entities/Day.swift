import Foundation
import SwiftData

@available(iOS 17, *)
@Model
class Day {
    var id: UUID = UUID()
    var date: Date
    var meals: [Meal] = []
    
    init(date: Date) {
        self.date = date
    }
}
