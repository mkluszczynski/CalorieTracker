import SwiftUI

struct NutritionView: View {
    let name: String
    let nutrition: Nutrition

    var body: some View {
        VStack{
            VStack{
                HStack(alignment: .firstTextBaseline){
                    Text( name)
                        .font(.system(size: 15))
                    Text("\(nutrition.value.formatRounded(to: 0))")
                        .font(.system(size: 15))
                        .bold()
                }
                Text("/ \(nutrition.target.formatRounded(to: 0))")
            }
            .scaledToFit()
            .minimumScaleFactor(0.5)
            ProgressView(value: nutrition.value, total: nutrition.target)
        }
    }
}
