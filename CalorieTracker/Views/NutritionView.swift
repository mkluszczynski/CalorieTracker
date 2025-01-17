import SwiftUI
struct NutritionView: View {
    let name: String
    let value: Int
    let target: Int

    var body: some View {
        VStack {
            Text(name)
                .font(.headline)
            Text("\(value) / \(target)")
                .font(.subheadline)
                .foregroundColor(.gray)
            ProgressView(value: Float(value), total: Float(target))
                .progressViewStyle(LinearProgressViewStyle())
        }
        .padding()
    }
}
