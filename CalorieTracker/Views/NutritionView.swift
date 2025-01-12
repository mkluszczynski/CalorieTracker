//
//  NutritionView.swift
//  CalorieTracker
//
//  Created by Mateusz Kluszczynski on 12/01/2025.
//

import SwiftUI

struct NutritionView: View {
    var name: String
    var value: Int
    var target: Int
    
    var body: some View {
        VStack{
            VStack{
                HStack(alignment: .firstTextBaseline){
                    Text( name)
                        .font(.system(size: 15))
                    Text("\(value)")
                        .font(.system(size: 15))
                        .bold()
                    
                }
                Text("/ \(target)")
                
            }
            .scaledToFit()
            .minimumScaleFactor(0.5)
            ProgressView(value: Double(value), total: Double(target))
        }
                
    }
}
