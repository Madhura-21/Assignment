
import SwiftUI

struct ContentView: View {
    @StateObject var apiViewModel = APIViewModel()
    @State var isTopLinkSelected = true
    @State var isRecentLinkSelected = false
    
    var body: some View {
       
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Dashboard")
                    .font(.title)
                    .foregroundStyle(Color.white)
                    .bold()
                Spacer()
                Image("Button")
                    .foregroundStyle(Color.black)
            }
            .padding()
            ScrollView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color("BackgroundColor"))
                        .cornerRadius(16)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(apiViewModel.greetingLogic())")
                            .foregroundStyle(Color.gray)
                        HStack {
                            Text("Ajay Manva")
                                .font(.title)
                            Image("wavingHand")
                        }
                        .padding(.bottom, 10)
                        GraphView(apiVM: apiViewModel)
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 15) {
                                RectComponent(iconImage: "ClickAvatar",
                                              text: "\(apiViewModel.responceModel?.today_clicks ?? 0)",
                                              discribtion: "Today’s clicks")
                                RectComponent(iconImage: "LocationAvatar",
                                              text: apiViewModel.responceModel?.top_location ?? "",
                                              discribtion: "Top Location")
                                RectComponent(iconImage: "SourceAvatar",
                                              text: apiViewModel.responceModel?.top_source ?? "",
                                              discribtion: "Top source")
                            }
                        }
                        .padding(.vertical)
                        HStack(alignment: .center) {
                            Image("Arrows")
                            Text("View Analytics")
                        }
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(style: StrokeStyle(lineWidth: 1))
                                .foregroundStyle(Color.gray)
                        }
                        HStack {
                            LinkTab(isSelected: $isTopLinkSelected, text: "Top Links") {
                                isTopLinkSelected = true
                                isRecentLinkSelected = false
                            }
                            LinkTab(isSelected: $isRecentLinkSelected, text: "Recent Links") {
                                isTopLinkSelected = false
                                isRecentLinkSelected = true
                            }
                            Spacer()
                            Image("SearchImage")
                        }
                        .padding(.vertical)
                        if isTopLinkSelected {
                            ForEach(apiViewModel.topLinks, id: \.url_id) { content in
                                ListView(linkModel: content)
                            }
                        }
                        if isRecentLinkSelected {
                            ForEach(apiViewModel.recentLinks, id: \.url_id) { content in
                                ListView(linkModel: content)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
            }
        .background(Color.blue)
        .edgesIgnoringSafeArea(.bottom)
        .task {
            await apiViewModel.performRequest()
        }
    }
}

#Preview {
    ContentView()
}
