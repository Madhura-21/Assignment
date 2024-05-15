
import SwiftUI
import Charts

struct GraphView: View {
    @ObservedObject var apiVM: APIViewModel
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(8)
            VStack {
                HStack {
                    Text("Overview")
                        .foregroundStyle(Color.gray)
                    Spacer()
                    Text("22 Aug - 23 Sept")
                        .font(.caption2)
                        .padding(5)
                        .border(Color.gray)
                }
                .padding()
                Chart {
                    if let chartData = apiVM.responceModel?.data?.overall_url_chart {
                        ForEach(chartData.sorted(by: >), id: \.key) { key, value in
                            LineMark(x: .value("Time", key),
                                     y: .value("Value", value))
                        }
                    }
                }
                .padding()
            }
        }
    }
}
