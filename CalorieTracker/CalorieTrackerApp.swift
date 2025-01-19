import SwiftUI
import SwiftData

@available(iOS 17, *)
@main
struct CalorieTrackerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Day.self, Meal.self, Food.self])
            do {
                let container = try ModelContainer(for: schema)
                return container
            } catch {
                fatalError("Failed to initialize ModelContainer: \(error)")
            }
        }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(FoodStore())
        }
        .modelContainer(sharedModelContainer)
    }
}
