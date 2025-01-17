import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mealStore: MealStore
    @StateObject var addFoodViewModel = AddFoodViewModel()

    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Text("🍏 FitTracker")
                    .font(.largeTitle)
                    .padding()
                
                MealListView()
                NutritionGroupView() 
            }
            .navigationDestination(for: Meal.self) { meal in
                AddFoodView(meal: meal)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(MealStore())
}



class MealStore: ObservableObject {
    @Published var meals: [Meal] = [
        Meal(name: "Śniadanie", foods: []),
        Meal(name: "Drugie śniadanie", foods: []),
        Meal(name: "Obiad", foods: []),
        Meal(name: "Kolacja", foods: [])
    ]
    
    @Published var availableFoods: [Food] = [
        Food(name: "Salmon", icon: "🐟", calories: 200, proteins: 22, fat: 12, carbohydrates: 0),
        Food(name: "Halibut", icon: "🐟", calories: 120, proteins: 20, fat: 10, carbohydrates: 0),
        Food(name: "Tuna", icon: "🐟", calories: 180, proteins: 24, fat: 10, carbohydrates: 0),
        Food(name: "Mackerel", icon: "🐟", calories: 205, proteins: 21, fat: 14, carbohydrates: 0),
        Food(name: "Herring", icon: "🐟", calories: 180, proteins: 22, fat: 11, carbohydrates: 0),
        Food(name: "Eel", icon: "🐟", calories: 210, proteins: 18, fat: 14, carbohydrates: 0),
        Food(name: "Sprat", icon: "🐟", calories: 200, proteins: 22, fat: 11, carbohydrates: 0),
        Food(name: "Sardine", icon: "🐟", calories: 200, proteins: 20, fat: 11, carbohydrates: 0),
        Food(name: "Carp", icon: "🐟", calories: 150, proteins: 18, fat: 9, carbohydrates: 0),
        Food(name: "Trout", icon: "🐟", calories: 180, proteins: 20, fat: 8, carbohydrates: 0),
        Food(name: "Redfish", icon: "🐟", calories: 170, proteins: 19, fat: 9, carbohydrates: 0),
        Food(name: "Turbot", icon: "🐟", calories: 160, proteins: 18, fat: 7, carbohydrates: 0),
        Food(name: "Perch", icon: "🐟", calories: 90, proteins: 18, fat: 2, carbohydrates: 0),
        Food(name: "Sole", icon: "🐟", calories: 85, proteins: 17, fat: 1, carbohydrates: 0),
        Food(name: "Cod", icon: "🐟", calories: 90, proteins: 18, fat: 2, carbohydrates: 0),
        Food(name: "Pollock", icon: "🐟", calories: 85, proteins: 16, fat: 2, carbohydrates: 0),
        Food(name: "Zander", icon: "🐟", calories: 110, proteins: 20, fat: 3, carbohydrates: 0),
        Food(name: "Tilapia", icon: "🐟", calories: 120, proteins: 20, fat: 3, carbohydrates: 0),
        Food(name: "Pike", icon: "🐟", calories: 120, proteins: 18, fat: 4, carbohydrates: 0),
        Food(name: "Pollack", icon: "🐟", calories: 85, proteins: 16, fat: 2, carbohydrates: 0),
        Food(name: "Kerguelen", icon: "🐟", calories: 80, proteins: 15, fat: 1, carbohydrates: 0),
        Food(name: "Miruna", icon: "🐟", calories: 90, proteins: 16, fat: 2, carbohydrates: 0),
        Food(name: "Pangasius", icon: "🐟", calories: 90, proteins: 18, fat: 3, carbohydrates: 0),
        Food(name: "Roach", icon: "🐟", calories: 80, proteins: 15, fat: 1, carbohydrates: 0),
        Food(name: "Bream", icon: "🐟", calories: 95, proteins: 17, fat: 4, carbohydrates: 0),
        Food(name: "Plaice", icon: "🐟", calories: 95, proteins: 17, fat: 1, carbohydrates: 0),
        Food(name: "Gilt-head bream", icon: "🐟", calories: 100, proteins: 18, fat: 3, carbohydrates: 0),
        Food(name: "Flounder", icon: "🐟", calories: 80, proteins: 16, fat: 1, carbohydrates: 0),
        Food(name: "Bitter Orange", icon: "🍊", calories: 40, proteins: 1, fat: 0, carbohydrates: 10),
        Food(name: "Blood Orange", icon: "🍊", calories: 40, proteins: 1, fat: 0, carbohydrates: 9),
        Food(name: "Citron", icon: "🍋", calories: 30, proteins: 1, fat: 0, carbohydrates: 8),
        Food(name: "Clementine", icon: "🍊", calories: 50, proteins: 1, fat: 0, carbohydrates: 12),
        Food(name: "Grapefruit", icon: "🍊", calories: 50, proteins: 1, fat: 0, carbohydrates: 12),
        Food(name: "Jamaican Tangelo", icon: "🍊", calories: 60, proteins: 1, fat: 0, carbohydrates: 15),
        Food(name: "Key Lime", icon: "🍋", calories: 20, proteins: 0, fat: 0, carbohydrates: 6),
        Food(name: "Kumquat", icon: "🍊", calories: 30, proteins: 1, fat: 0, carbohydrates: 8),
        Food(name: "Lemon", icon: "🍋", calories: 30, proteins: 1, fat: 0, carbohydrates: 9),
        Food(name: "Lime", icon: "🍋", calories: 20, proteins: 0, fat: 0, carbohydrates: 7),
        Food(name: "Mandarin", icon: "🍊", calories: 40, proteins: 1, fat: 0, carbohydrates: 10),
        Food(name: "Orange", icon: "🍊", calories: 50, proteins: 1, fat: 0, carbohydrates: 12),
        Food(name: "Persian Lime", icon: "🍋", calories: 25, proteins: 0, fat: 0, carbohydrates: 6),
        Food(name: "Pomelo", icon: "🍊", calories: 40, proteins: 1, fat: 0, carbohydrates: 9),
        Food(name: "Sweet Lime", icon: "🍋", calories: 30, proteins: 1, fat: 0, carbohydrates: 8),
        Food(name: "Taiwan Tangerine", icon: "🍊", calories: 45, proteins: 1, fat: 0, carbohydrates: 11),
        Food(name: "Tangelo", icon: "🍊", calories: 60, proteins: 1, fat: 0, carbohydrates: 15),
        Food(name: "Tangerine", icon: "🍊", calories: 45, proteins: 1, fat: 0, carbohydrates: 11),
        Food(name: "Yuzu", icon: "🍋", calories: 20, proteins: 0, fat: 0, carbohydrates: 5),
        Food(name: "Apricot", icon: "🍑", calories: 48, proteins: 1, fat: 0, carbohydrates: 12),
        Food(name: "Cherry", icon: "🍒", calories: 50, proteins: 1, fat: 0, carbohydrates: 12),
        Food(name: "Damson", icon: "🍑", calories: 45, proteins: 0, fat: 0, carbohydrates: 12),
        Food(name: "Dates", icon: "🌴", calories: 277, proteins: 2, fat: 0, carbohydrates: 75),
        Food(name: "Japanese Plum", icon: "🍑", calories: 50, proteins: 1, fat: 0, carbohydrates: 13),
        Food(name: "Jujube", icon: "🌰", calories: 79, proteins: 1, fat: 0, carbohydrates: 21),
        Food(name: "Nectarine", icon: "🍑", calories: 44, proteins: 1, fat: 0, carbohydrates: 11),
        Food(name: "Peach", icon: "🍑", calories: 59, proteins: 1, fat: 0, carbohydrates: 15),
        Food(name: "Plum", icon: "🍑", calories: 46, proteins: 1, fat: 0, carbohydrates: 11),
        Food(name: "Plumcot", icon: "🍑", calories: 50, proteins: 1, fat: 0, carbohydrates: 13),
        Food(name: "Bearberry", icon: "🍇", calories: 50, proteins: 1, fat: 0, carbohydrates: 13),
        Food(name: "Black Currants", icon: "🍇", calories: 63, proteins: 1, fat: 0, carbohydrates: 15),
        Food(name: "Blueberry", icon: "🫐", calories: 57, proteins: 0, fat: 0, carbohydrates: 14),
        Food(name: "Boysenberry", icon: "🍇", calories: 50, proteins: 1, fat: 0, carbohydrates: 12),
        Food(name: "Caperberry", icon: "🍇", calories: 20, proteins: 1, fat: 0, carbohydrates: 5),
        Food(name: "Chokeberry", icon: "🍇", calories: 55, proteins: 1, fat: 0, carbohydrates: 14),
        Food(name: "Chokecherry", icon: "🍒", calories: 60, proteins: 1, fat: 0, carbohydrates: 16),
        Food(name: "Cloudberry", icon: "🍇", calories: 60, proteins: 1, fat: 0, carbohydrates: 14),
        Food(name: "Cranberry", icon: "🍒", calories: 46, proteins: 1, fat: 0, carbohydrates: 12),
        Food(name: "Elderberry", icon: "🍇", calories: 73, proteins: 1, fat: 0, carbohydrates: 18),
        Food(name: "Goji Berry", icon: "🍇", calories: 80, proteins: 3, fat: 0, carbohydrates: 20),
        Food(name: "Gooseberry", icon: "🍇", calories: 44, proteins: 1, fat: 0, carbohydrates: 11),
        Food(name: "Grapes", icon: "🍇", calories: 69, proteins: 0, fat: 0, carbohydrates: 18),
        Food(name: "Huckleberry", icon: "🫐", calories: 60, proteins: 1, fat: 0, carbohydrates: 15),
        Food(name: "Lingonberry", icon: "🍇", calories: 50, proteins: 1, fat: 0, carbohydrates: 12),
        Food(name: "Physalis (Cape Gooseberry)", icon: "🍇", calories: 50, proteins: 1, fat: 0, carbohydrates: 13),
        Food(name: "Red Currants", icon: "🍇", calories: 56, proteins: 1, fat: 0, carbohydrates: 14),
        Food(name: "Salmonberry", icon: "🍇", calories: 70, proteins: 1, fat: 0, carbohydrates: 18),
        Food(name: "Beef", icon: "🥩", calories: 250, proteins: 26, fat: 15, carbohydrates: 0),
        Food(name: "Chicken", icon: "🍗", calories: 165, proteins: 31, fat: 4, carbohydrates: 0),
        Food(name: "Pork", icon: "🍖", calories: 242, proteins: 27, fat: 14, carbohydrates: 0),
        Food(name: "Lamb", icon: "🍖", calories: 294, proteins: 25, fat: 21, carbohydrates: 0),
        Food(name: "Turkey", icon: "🦃", calories: 135, proteins: 30, fat: 1, carbohydrates: 0),
        Food(name: "Duck", icon: "🦆", calories: 337, proteins: 19, fat: 28, carbohydrates: 0),
        Food(name: "Goat", icon: "🍖", calories: 122, proteins: 22, fat: 4, carbohydrates: 0),
        Food(name: "Veal", icon: "🥩", calories: 172, proteins: 30, fat: 6, carbohydrates: 0),
        Food(name: "Bison", icon: "🥩", calories: 143, proteins: 30, fat: 2, carbohydrates: 0),
        Food(name: "Rabbit", icon: "🐇", calories: 173, proteins: 33, fat: 3, carbohydrates: 0),
        Food(name: "Horse", icon: "🥩", calories: 143, proteins: 20, fat: 7, carbohydrates: 0),
        Food(name: "Buffalo", icon: "🥩", calories: 143, proteins: 30, fat: 2, carbohydrates: 0),
        Food(name: "Pheasant", icon: "🦆", calories: 133, proteins: 24, fat: 3, carbohydrates: 0),
        Food(name: "Ostrich", icon: "🦢", calories: 143, proteins: 22, fat: 6, carbohydrates: 0),
        Food(name: "Kangaroo", icon: "🦘", calories: 98, proteins: 22, fat: 2, carbohydrates: 0),
        Food(name: "Quail", icon: "🦅", calories: 123, proteins: 22, fat: 3, carbohydrates: 0),
        Food(name: "Artichoke", icon: "🌿", calories: 47, proteins: 4, fat: 0, carbohydrates: 11),
        Food(name: "Asparagus", icon: "🌿", calories: 20, proteins: 2, fat: 0, carbohydrates: 4),
        Food(name: "Avocado", icon: "🥑", calories: 160, proteins: 2, fat: 15, carbohydrates: 9),
        Food(name: "Beetroot", icon: "🍠", calories: 43, proteins: 2, fat: 0, carbohydrates: 10),
        Food(name: "Bell Pepper", icon: "🌶️", calories: 31, proteins: 1, fat: 0, carbohydrates: 6),
        Food(name: "Broccoli", icon: "🥦", calories: 55, proteins: 4, fat: 1, carbohydrates: 11),
        Food(name: "Brussels Sprouts", icon: "🌱", calories: 43, proteins: 4, fat: 1, carbohydrates: 9),
        Food(name: "Cabbage", icon: "🥬", calories: 25, proteins: 1, fat: 0, carbohydrates: 6),
        Food(name: "Carrot", icon: "🥕", calories: 41, proteins: 1, fat: 0, carbohydrates: 10),
        Food(name: "Cauliflower", icon: "🥦", calories: 25, proteins: 2, fat: 0, carbohydrates: 5),
        Food(name: "Celery", icon: "🌿", calories: 14, proteins: 1, fat: 0, carbohydrates: 3),
        Food(name: "Chard", icon: "🍃", calories: 19, proteins: 2, fat: 0, carbohydrates: 4),
        Food(name: "Chili Pepper", icon: "🌶️", calories: 40, proteins: 2, fat: 0, carbohydrates: 9),
        Food(name: "Cucumber", icon: "🥒", calories: 16, proteins: 1, fat: 0, carbohydrates: 4),
        Food(name: "Eggplant", icon: "🍆", calories: 25, proteins: 1, fat: 0, carbohydrates: 6),
        Food(name: "Garlic", icon: "🧄", calories: 149, proteins: 6, fat: 0, carbohydrates: 33),
        Food(name: "Green Beans", icon: "🌱", calories: 31, proteins: 2, fat: 0, carbohydrates: 7),
        Food(name: "Kale", icon: "🍃", calories: 49, proteins: 4, fat: 1, carbohydrates: 10),
        Food(name: "Leek", icon: "🌿", calories: 61, proteins: 1, fat: 0, carbohydrates: 14),
        Food(name: "Lettuce", icon: "🥬", calories: 15, proteins: 1, fat: 0, carbohydrates: 3),
        Food(name: "Mushrooms", icon: "🍄", calories: 22, proteins: 3, fat: 0, carbohydrates: 4),
        Food(name: "Onion", icon: "🧅", calories: 40, proteins: 1, fat: 0, carbohydrates: 9),
        Food(name: "Peas", icon: "🟢", calories: 81, proteins: 5, fat: 0, carbohydrates: 14),
        Food(name: "Potato", icon: "🥔", calories: 77, proteins: 2, fat: 0, carbohydrates: 17),
        Food(name: "Pumpkin", icon: "🎃", calories: 26, proteins: 1, fat: 0, carbohydrates: 7),
        Food(name: "Radish", icon: "🌶️", calories: 16, proteins: 0, fat: 0, carbohydrates: 4),
        Food(name: "Spinach", icon: "🍃", calories: 23, proteins: 3, fat: 0, carbohydrates: 4),
        Food(name: "Squash", icon: "🍖", calories: 40, proteins: 1, fat: 0, carbohydrates: 10),
        Food(name: "Sweet Potato", icon: "🍠", calories: 86, proteins: 2, fat: 0, carbohydrates: 20),
        Food(name: "Tomato", icon: "🍅", calories: 18, proteins: 1, fat: 0, carbohydrates: 4),
        Food(name: "Zucchini", icon: "🍆", calories: 17, proteins: 1, fat: 0, carbohydrates: 4),
        Food(name: "Spaghetti Carbonara", icon: "🍝", calories: 400, proteins: 20, fat: 25, carbohydrates: 35),
        Food(name: "Spaghetti Bolognese", icon: "🍝", calories: 450, proteins: 30, fat: 15, carbohydrates: 50),
        Food(name: "Penne Arrabbiata", icon: "🍝", calories: 350, proteins: 8, fat: 10, carbohydrates: 55),
        Food(name: "Fettuccine Alfredo", icon: "🍝", calories: 600, proteins: 15, fat: 35, carbohydrates: 50),
        Food(name: "Lasagna", icon: "🍝", calories: 700, proteins: 40, fat: 35, carbohydrates: 50),
        Food(name: "Mac and Cheese", icon: "🍝", calories: 500, proteins: 15, fat: 20, carbohydrates: 55),
        Food(name: "Ravioli with Tomato Sauce", icon: "🍝", calories: 400, proteins: 15, fat: 12, carbohydrates: 55),
        Food(name: "Penne alla Vodka", icon: "🍝", calories: 550, proteins: 10, fat: 25, carbohydrates: 70),
        Food(name: "Spaghetti Puttanesca", icon: "🍝", calories: 450, proteins: 12, fat: 18, carbohydrates: 60),
        Food(name: "Fusilli with Pesto", icon: "🍝", calories: 480, proteins: 10, fat: 25, carbohydrates: 55),
        Food(name: "Tagliatelle with Mushroom Cream Sauce", icon: "🍝", calories: 500, proteins: 12, fat: 25, carbohydrates: 60),
        Food(name: "Baked Ziti", icon: "🍝", calories: 550, proteins: 25, fat: 20, carbohydrates: 65),
        Food(name: "Orecchiette with Broccoli and Sausage", icon: "🍝", calories: 600, proteins: 35, fat: 30, carbohydrates: 45),
        Food(name: "Cacio e Pepe", icon: "🍝", calories: 400, proteins: 12, fat: 18, carbohydrates: 50),
        Food(name: "Fusilli with Tomato Basil Sauce", icon: "🍝", calories: 350, proteins: 8, fat: 12, carbohydrates: 55),
        Food(name: "Gnocchi with Pesto", icon: "🍝", calories: 500, proteins: 12, fat: 25, carbohydrates: 60),
        Food(name: "Pasta Primavera", icon: "🍝", calories: 450, proteins: 10, fat: 15, carbohydrates: 65),
        Food(name: "Margherita Pizza", icon: "🍕", calories: 250, proteins: 10, fat: 8, carbohydrates: 35),
        Food(name: "Pepperoni Pizza", icon: "🍕", calories: 300, proteins: 12, fat: 15, carbohydrates: 35),
        Food(name: "Hawaiian Pizza", icon: "🍕", calories: 350, proteins: 15, fat: 18, carbohydrates: 35),
        Food(name: "BBQ Chicken Pizza", icon: "🍕", calories: 400, proteins: 20, fat: 20, carbohydrates: 45),
        Food(name: "Veggie Pizza", icon: "🍕", calories: 280, proteins: 8, fat: 10, carbohydrates: 40),
        Food(name: "Four Cheese Pizza", icon: "🍕", calories: 450, proteins: 15, fat: 25, carbohydrates: 40),
        Food(name: "Meat Lover's Pizza", icon: "🍕", calories: 500, proteins: 25, fat: 30, carbohydrates: 40),
        Food(name: "Margarita Pizza with Prosciutto", icon: "🍕", calories: 280, proteins: 12, fat: 12, carbohydrates: 35),
        Food(name: "Seafood Pizza", icon: "🍕", calories: 350, proteins: 20, fat: 15, carbohydrates: 40),
        Food(name: "Buffalo Chicken Pizza", icon: "🍕", calories: 400, proteins: 20, fat: 22, carbohydrates: 45),
        Food(name: "Capricciosa Pizza", icon: "🍕", calories: 380, proteins: 18, fat: 20, carbohydrates: 40),
        Food(name: "Neapolitan Pizza", icon: "🍕", calories: 250, proteins: 8, fat: 10, carbohydrates: 30),
        Food(name: "Pesto Chicken Pizza", icon: "🍕", calories: 420, proteins: 22, fat: 25, carbohydrates: 45),
        Food(name: "Bianca Pizza", icon: "🍕", calories: 370, proteins: 12, fat: 20, carbohydrates: 40),
        Food(name: "Marinara Pizza", icon: "🍕", calories: 220, proteins: 6, fat: 8, carbohydrates: 30),
        Food(name: "Quattro Stagioni Pizza", icon: "🍕", calories: 450, proteins: 20, fat: 25, carbohydrates: 40),
        Food(name: "Calzone", icon: "🍕", calories: 550, proteins: 25, fat: 28, carbohydrates: 50),
        Food(name: "Prosciutto and Arugula Pizza", icon: "🍕", calories: 300, proteins: 15, fat: 18, carbohydrates: 35),
        Food(name: "Spinach and Ricotta Pizza", icon: "🍕", calories: 350, proteins: 12, fat: 18, carbohydrates: 40),
        Food(name: "Grilled Salmon", icon: "🐟", calories: 350, proteins: 30, fat: 20, carbohydrates: 0),
        Food(name: "Grilled Tuna", icon: "🐟", calories: 250, proteins: 30, fat: 10, carbohydrates: 0),
        Food(name: "Seared Steak", icon: "🥩", calories: 500, proteins: 40, fat: 35, carbohydrates: 0),
        Food(name: "Chicken Breast", icon: "🍗", calories: 200, proteins: 40, fat: 5, carbohydrates: 0),
        Food(name: "Roast Pork", icon: "🐖", calories: 450, proteins: 35, fat: 30, carbohydrates: 0),
        Food(name: "BBQ Ribs", icon: "🍖", calories: 600, proteins: 40, fat: 40, carbohydrates: 20),
        Food(name: "Lamb Chops", icon: "🍖", calories: 600, proteins: 45, fat: 40, carbohydrates: 0),
        Food(name: "Grilled Shrimp", icon: "🍤", calories: 200, proteins: 30, fat: 5, carbohydrates: 0),
        Food(name: "Fish Tacos", icon: "🌮", calories: 350, proteins: 25, fat: 10, carbohydrates: 40),
        Food(name: "Fried Fish Fillet", icon: "🐟", calories: 400, proteins: 25, fat: 20, carbohydrates: 30),
        Food(name: "Chicken Wings", icon: "🍗", calories: 300, proteins: 25, fat: 20, carbohydrates: 5),
        Food(name: "Grilled Swordfish", icon: "🐟", calories: 350, proteins: 35, fat: 15, carbohydrates: 0),
        Food(name: "Beef Tenderloin", icon: "🥩", calories: 600, proteins: 50, fat: 40, carbohydrates: 0),
        Food(name: "Pork Schnitzel", icon: "🐖", calories: 500, proteins: 40, fat: 30, carbohydrates: 40),
        Food(name: "Chicken Parmesan", icon: "🍗", calories: 550, proteins: 40, fat: 25, carbohydrates: 50),
        Food(name: "Lobster Tail", icon: "🦞", calories: 250, proteins: 25, fat: 15, carbohydrates: 0),
        Food(name: "Steak Frites", icon: "🥩", calories: 700, proteins: 50, fat: 45, carbohydrates: 50),
        Food(name: "Duck Breast", icon: "🦆", calories: 450, proteins: 35, fat: 30, carbohydrates: 0),
        Food(name: "Grilled Mahi-Mahi", icon: "🐟", calories: 300, proteins: 35, fat: 15, carbohydrates: 0),
        Food(name: "Veal Cutlet", icon: "🍖", calories: 500, proteins: 45, fat: 25, carbohydrates: 10),
        Food(name: "Stuffed Salmon", icon: "🐟", calories: 500, proteins: 40, fat: 30, carbohydrates: 20),
        Food(name: "Baked Cod", icon: "🐟", calories: 250, proteins: 25, fat: 10, carbohydrates: 0),
        Food(name: "Roast Beef", icon: "🥩", calories: 600, proteins: 45, fat: 40, carbohydrates: 0),
        Food(name: "BBQ Chicken", icon: "🍗", calories: 350, proteins: 30, fat: 20, carbohydrates: 25),
        Food(name: "Grilled Lamb", icon: "🍖", calories: 500, proteins: 40, fat: 35, carbohydrates: 0),
        Food(name: "Shrimp Scampi", icon: "🍤", calories: 400, proteins: 25, fat: 20, carbohydrates: 25),
        Food(name: "Pulled Pork", icon: "🐖", calories: 450, proteins: 30, fat: 30, carbohydrates: 30),
        Food(name: "Chicken Stir Fry", icon: "🍗", calories: 350, proteins: 30, fat: 15, carbohydrates: 40),
        Food(name: "Baked Chicken", icon: "🍗", calories: 250, proteins: 35, fat: 10, carbohydrates: 0),
        Food(name: "Caesar Salad", icon: "🥗", calories: 500, proteins: 20, fat: 35, carbohydrates: 25),
        Food(name: "Greek Salad", icon: "🥗", calories: 300, proteins: 10, fat: 25, carbohydrates: 15),
        Food(name: "Cobb Salad", icon: "🥗", calories: 700, proteins: 40, fat: 45, carbohydrates: 20),
        Food(name: "Garden Salad", icon: "🥗", calories: 150, proteins: 5, fat: 10, carbohydrates: 15),
        Food(name: "Caprese Salad", icon: "🥗", calories: 250, proteins: 10, fat: 20, carbohydrates: 15),
        Food(name: "Nicoise Salad", icon: "🥗", calories: 600, proteins: 35, fat: 40, carbohydrates: 25),
        Food(name: "Waldorf Salad", icon: "🥗", calories: 350, proteins: 5, fat: 25, carbohydrates: 40),
        Food(name: "Pasta Salad", icon: "🥗", calories: 400, proteins: 15, fat: 20, carbohydrates: 50),
        Food(name: "Tuna Salad", icon: "🥗", calories: 350, proteins: 30, fat: 20, carbohydrates: 5),
        Food(name: "Chicken Salad", icon: "🥗", calories: 450, proteins: 35, fat: 25, carbohydrates: 10),
        Food(name: "Spinach Salad", icon: "🥗", calories: 200, proteins: 10, fat: 15, carbohydrates: 10),
        Food(name: "Avocado Salad", icon: "🥗", calories: 400, proteins: 5, fat: 35, carbohydrates: 20),
        Food(name: "Quinoa Salad", icon: "🥗", calories: 300, proteins: 10, fat: 15, carbohydrates: 35),
        Food(name: "Chickpea Salad", icon: "🥗", calories: 350, proteins: 15, fat: 15, carbohydrates: 40),
        Food(name: "Beetroot Salad", icon: "🥗", calories: 250, proteins: 5, fat: 15, carbohydrates: 30),
        Food(name: "Broccoli Salad", icon: "🥗", calories: 150, proteins: 5, fat: 10, carbohydrates: 15),
        Food(name: "Mango Salad", icon: "🥗", calories: 300, proteins: 5, fat: 15, carbohydrates: 50),
        Food(name: "Arugula Salad", icon: "🥗", calories: 120, proteins: 5, fat: 10, carbohydrates: 10),
        Food(name: "Fattoush Salad", icon: "🥗", calories: 350, proteins: 5, fat: 25, carbohydrates: 35),
        Food(name: "Panzanella Salad", icon: "🥗", calories: 400, proteins: 10, fat: 20, carbohydrates: 45),
        Food(name: "Carrot Salad", icon: "🥗", calories: 150, proteins: 3, fat: 8, carbohydrates: 18),
        Food(name: "Egg Salad", icon: "🥗", calories: 450, proteins: 20, fat: 35, carbohydrates: 5),
        Food(name: "Asian Cabbage Salad", icon: "🥗", calories: 250, proteins: 5, fat: 15, carbohydrates: 30),
        Food(name: "French Fries", icon: "🍟", calories: 350, proteins: 4, fat: 17, carbohydrates: 45),
        Food(name: "Sweet Potato Fries", icon: "🍠", calories: 200, proteins: 2, fat: 8, carbohydrates: 35),
        Food(name: "Onion Rings", icon: "🧅", calories: 300, proteins: 3, fat: 18, carbohydrates: 35),
        Food(name: "Mashed Potatoes", icon: "🥔", calories: 210, proteins: 4, fat: 8, carbohydrates: 30),
        Food(name: "Baked Potato", icon: "🥔", calories: 160, proteins: 4, fat: 0, carbohydrates: 37),
        Food(name: "Rice", icon: "🍚", calories: 200, proteins: 4, fat: 1, carbohydrates: 45),
        Food(name: "Garlic Bread", icon: "🍞", calories: 180, proteins: 4, fat: 8, carbohydrates: 25),
        Food(name: "Coleslaw", icon: "🥗", calories: 150, proteins: 2, fat: 10, carbohydrates: 18),
        Food(name: "Corn on the Cob", icon: "🌽", calories: 90, proteins: 3, fat: 1, carbohydrates: 20),
        Food(name: "Grilled Vegetables", icon: "🍆", calories: 100, proteins: 3, fat: 5, carbohydrates: 15),
        Food(name: "Garlic Mashed Potatoes", icon: "🥔", calories: 250, proteins: 5, fat: 12, carbohydrates: 32),
        Food(name: "Fried Zucchini", icon: "🥒", calories: 250, proteins: 5, fat: 14, carbohydrates: 30),
        Food(name: "Fried Pickles", icon: "🥒", calories: 200, proteins: 3, fat: 12, carbohydrates: 20),
        Food(name: "Cornbread", icon: "🍞", calories: 200, proteins: 5, fat: 7, carbohydrates: 30),
        Food(name: "Potato Wedges", icon: "🍟", calories: 220, proteins: 4, fat: 12, carbohydrates: 28),
        Food(name: "Hush Puppies", icon: "🧆", calories: 210, proteins: 4, fat: 12, carbohydrates: 25),
        Food(name: "Roast Potatoes", icon: "🥔", calories: 180, proteins: 4, fat: 6, carbohydrates: 30),
        Food(name: "Bruschetta", icon: "🍞", calories: 150, proteins: 3, fat: 7, carbohydrates: 20),
        Food(name: "Stuffed Mushrooms", icon: "🍄", calories: 120, proteins: 5, fat: 9, carbohydrates: 10),
        Food(name: "Baked Beans", icon: "🍲", calories: 150, proteins: 5, fat: 1, carbohydrates: 30),
        Food(name: "Fried Rice", icon: "🍚", calories: 300, proteins: 6, fat: 10, carbohydrates: 45),
        Food(name: "Cucumber Salad", icon: "🥒", calories: 100, proteins: 3, fat: 5, carbohydrates: 15),
        Food(name: "Tomato Salad", icon: "🍅", calories: 120, proteins: 2, fat: 8, carbohydrates: 15),

    ]
    
    var nutritionSummary: [Nutrition] {
        let totalCalories = meals.flatMap { $0.foods }.reduce(0) { $0 + $1.calories }
        let totalProteins = meals.flatMap { $0.foods }.reduce(0) { $0 + $1.proteins }
        let totalFat = meals.flatMap { $0.foods }.reduce(0) { $0 + $1.fat }
        let totalCarbohydrates = meals.flatMap { $0.foods }.reduce(0) { $0 + $1.carbohydrates }

        return [
            Nutrition(name: "Kalorie", value: totalCalories, target: 2100),
            Nutrition(name: "Białko", value: totalProteins, target: 150),
            Nutrition(name: "Tłuszcze", value: totalFat, target: 70),
            Nutrition(name: "Węglowodany", value: totalCarbohydrates, target: 250)
        ]
    }
    
    
    
    
}



struct NutritionSummary {
    var name: String
    var value: Int
    var target: Int
}


struct Food: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let icon: String
    let calories: Int
    let proteins: Int
    let fat: Int
    let carbohydrates: Int
}

struct Meal: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    var foods: [Food]
    
}
