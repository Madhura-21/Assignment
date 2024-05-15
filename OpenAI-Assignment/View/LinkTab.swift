
import SwiftUI

struct LinkTab: View {
    @Binding var isSelected: Bool
    var text: String = ""
    var completion: (() -> Void)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 18)
            .frame(width: 110, height: 40)
            .foregroundStyle(isSelected ? Color.blue : Color("BackgroundColor"))
            .overlay {
                Text(text)
                    .foregroundStyle(isSelected ? Color.white : Color.gray)
                    .bold()
            }
            .onTapGesture {
               completion()
            }
    }
}
