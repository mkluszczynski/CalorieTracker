import Foundation
extension Float {
    func formatRounded(to places: Int) -> String{
        return String(format: "%.\(places)f", self)
    }
}
