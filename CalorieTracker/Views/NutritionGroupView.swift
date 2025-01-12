//
//  NutritionGroupView.swift
//  CalorieTracker
//
//  Created by Mateusz Kluszczynski on 12/01/2025.
//

import SwiftUI

struct NutritionGroupView: View {
    @State var nutritionList: [Nutrition] = [
        Nutrition(name: "Kalc", value: 1200, target: 2100),
        Nutrition(name: "Prot", value: 1200, target: 2100),
        Nutrition(name: "Fat", value: 1200, target: 2100),
        Nutrition(name: "Carbo", value: 1200, target: 2100)
    ]
    
    var body: some View {
        HStack{
            ForEach(nutritionList) { nutrition in
                NutritionView(name: nutrition.name, value: nutrition.value, target: nutrition.target)
            }
            
        }
        .padding(10)
    }
}

#Preview {
    NutritionGroupView()
}

struct Nutrition: Identifiable {
    let id: UUID = UUID()
    let name: String
    let value: Int
    let target: Int
}
