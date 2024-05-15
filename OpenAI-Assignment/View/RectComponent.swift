
import SwiftUI

struct RectComponent: View {
    var iconImage: String
    var text: String
    var discribtion: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .frame(width: 120, height: 120)
            VStack(alignment: .leading, spacing: 10) {
                Image(iconImage)
                    .frame(width: 32, height: 32)
                Text(text)
                    .bold()
                Text(discribtion)
                    .foregroundStyle(Color.gray)
            }
        }
    }
}
