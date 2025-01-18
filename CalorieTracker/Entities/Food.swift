//
//  Food.swift
//  CalorieTracker
//
//  Created by Mateusz Kluszczynski on 17/01/2025.
//

import SwiftUI

struct Food: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let icon: String
    let calories: Float
    let proteins: Float
    let fat: Float
    let carbohydrates: Float
}
