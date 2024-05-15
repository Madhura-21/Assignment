
import Foundation

struct ResponceModel : Codable {
    let status : Bool?
    let statusCode : Int?
    let message : String?
    let support_whatsapp_number : String?
    let extra_income : Double?
    let total_links : Int?
    let total_clicks : Int?
    let today_clicks : Int?
    let top_source : String?
    let top_location : String?
    let startTime : String?
    let links_created_today : Int?
    let applied_campaign : Int?
    let data : Data?
}

struct Data : Codable {
    let recent_links: [LinksModel]?
    let top_links: [LinksModel]?
    let overall_url_chart : [String: Int]
}

struct LinksModel : Codable {
let url_id: Int?
let web_link: String?
let total_clicks: Int?
let original_image: String?
let created_at: String?
let app: String?
}
