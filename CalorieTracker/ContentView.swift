import SwiftUI
import SwiftData

@available(iOS 17, *)
struct ContentView: View {
    @State var date: Date = Date()
    
    @Environment(\.modelContext) private var modelContext
    @Query() var days: [Day] = []
    
    var day: Day {
        getDay();
    }
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Text("🍏 FitTracker")
                    .padding()
                DatePicker("Wybierz datę:", selection: $date, in: ...Date(), displayedComponents: .date)
                    .padding(.horizontal)
                
                MealListView(meals: day.meals)
                NutritionGroupView(meals: day.meals)
            }
            .navigationDestination(for: Meal.self){ meal in
                AddFoodView(meal: meal)
            }
        }
        .onAppear{
//           deleteAllRecords()
        }
        
    }
    
    func getDay() -> Day{
        let res = days.first(where: {Calendar.current.isDate($0.date, inSameDayAs: date)})
        if(res == nil){
            return createDay()
        }
        return res!
    }
    
    func createDay() -> Day {
        let newDay = Day(date: date)
        
        let newMeals: [Meal] = [
            Meal(name: "Śniadanie", order: 1),
            Meal(name: "Drugie śniadanie", order: 2),
            Meal(name: "Obiad", order: 3),
            Meal(name: "Kolacja", order: 4),
        ]
        
        for meal in newMeals {
            modelContext.insert(meal)
        }
        
        newDay.meals = newMeals
        
        modelContext.insert(newDay)
        
        return newDay
    }
    
    private func deleteAllRecords() {
        do {
            let fetchDescriptor = FetchDescriptor<Day>() 
            let items = try modelContext.fetch(fetchDescriptor)
            
            for item in items {
                modelContext.delete(item)
            }
            
            try modelContext.save()
        } catch {
            print("Error deleting all records: \(error)")
        }
    }
}

