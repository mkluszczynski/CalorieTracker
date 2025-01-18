//
//  Float.swift
//  CalorieTracker
//
//  Created by Mateusz Kluszczynski on 17/01/2025.
//

import Foundation
extension Float {
    func formatRounded(to places: Int) -> String{
        return String(format: "%.\(places)f", self)
    }
}
