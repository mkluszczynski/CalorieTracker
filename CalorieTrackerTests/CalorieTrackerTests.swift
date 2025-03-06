import XCTest
@testable import CalorieTracker

final class CalorieTrackerTests: XCTestCase {
    var foodStore: FoodStore!
    var meal: Meal!
    
    override func setUpWithError() throws {
        foodStore = FoodStore()
        meal = Meal(name: "Test Meal", order: 1)
    }
    
    override func tearDownWithError() throws {
        foodStore = nil
        meal = nil
    }
    
    func testFoodStoreInitialization() throws {
        XCTAssertFalse(foodStore.smallFoods.isEmpty, "Food store should not be empty")
        XCTAssertTrue(foodStore.smallFoods.count > 0, "Food store should contain food items")
    }
    
    func testMealInitialization() throws {
        XCTAssertEqual(meal.name, "Test Meal", "Meal name should match initialized value")
        XCTAssertEqual(meal.order, 1, "Meal order should match initialized value")
        XCTAssertTrue(meal.foods.isEmpty, "New meal should have empty foods array")
    }
    
    func testAddFoodToMeal() throws {
        let food = Food(name: "Apple", icon: "🍎", calories: 95, proteins: 0.5, fat: 0.3, carbohydrates: 25)
        meal.foods.append(food)
        
        XCTAssertEqual(meal.foods.count, 1, "Meal should contain one food item")
        XCTAssertEqual(meal.foods.first?.name, "Apple", "Food name should match")
        XCTAssertEqual(meal.foods.first?.calories, 95, "Food calories should match")
    }
    
    func testNutritionCalculation() throws {
        let food1 = Food(name: "Apple", icon: "🍎", calories: 100, proteins: 1, fat: 0.5, carbohydrates: 25)
        let food2 = Food(name: "Banana", icon: "🍌", calories: 150, proteins: 2, fat: 0.3, carbohydrates: 30)
        
        meal.foods.append(food1)
        meal.foods.append(food2)
        
        let nutrition = Nutrition(value: meal.foods.reduce(0) { $0 + $1.calories }, target: 2100)
        
        XCTAssertEqual(nutrition.value, 250, "Total calories should be sum of all foods")
        XCTAssertEqual(nutrition.target, 2100, "Target calories should match default value")
    }
    
    func testFloatFormatting() throws {
        let number: Float = 123.456
        XCTAssertEqual(number.formatRounded(to: 0), "123")
        XCTAssertEqual(number.formatRounded(to: 1), "123.5")
        XCTAssertEqual(number.formatRounded(to: 2), "123.46")
    }
}