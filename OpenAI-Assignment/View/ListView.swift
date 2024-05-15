
import SwiftUI

struct ListView: View {
    let linkModel: LinksModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(8)
            VStack {
                HStack {
                    Image(linkModel.original_image ?? "")
                        .frame(width: 70, height: 70)
                        .background(Color.brown)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(linkModel.app ?? "")
                        Text(linkModel.created_at ?? "")
                            .foregroundStyle(Color.gray)
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(linkModel.total_clicks ?? 0)")
                        Text("clicks")
                            .foregroundStyle(Color.gray)
                    }
                }
                .padding()
                HStack {
                    Text(linkModel.web_link ?? "")
                    Spacer()
                    Image(systemName: "doc.on.doc")
                }
                .foregroundStyle(Color.blue)
                .padding(10)
                .background(Color("blueBackground"))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .foregroundStyle(Color("blueBackground"))
                }
            }
        }
        .cornerRadius(8)
    }
}
