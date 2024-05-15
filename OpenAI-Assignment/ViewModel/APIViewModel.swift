
import Foundation

class APIViewModel: ObservableObject {
    @Published var recentLinks: [LinksModel] = []
    @Published var topLinks: [LinksModel] = []
    @Published var responceModel: ResponceModel?
    
    func performRequest() async {
        let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
        
        if let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
            let task = URLSession.shared.dataTask(with: urlRequest) { data, responce, error in
                do {
                    let responce = try JSONDecoder().decode(ResponceModel.self, from: data!)
                    self.responceModel = responce
                    self.recentLinks = responce.data?.recent_links ?? []
                    self.topLinks = responce.data?.top_links ?? []
                } catch {
                    debugPrint(error)
                    print("API call failed ")
                }
            }
            task.resume()
        }
    }
    
    func greetingLogic() -> String {
      let hour = Calendar.current.component(.hour, from: Date())
      
      let NEW_DAY = 0
      let NOON = 12
      let SUNSET = 18
      let MIDNIGHT = 24
      
      var greetingText = "Hello" 
      switch hour {
      case NEW_DAY..<NOON:
          greetingText = "Good Morning"
      case NOON..<SUNSET:
          greetingText = "Good Afternoon"
      case SUNSET..<MIDNIGHT:
          greetingText = "Good Evening"
      default:
          _ = "Hello"
      }
      
      return greetingText
    }
    
}
