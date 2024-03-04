

import Foundation
import SwiftUI

//struct VisitSpots: Encodable {
//    let out: [Spot]
//}

struct VisitSpots:Codable{
    let out: [Spot]
}


struct Spot: Codable{
    let junre: String
    let location: String
    let lat: String //緯度
    let lon: String //経度
    let time: Double
    
//    enum CodingKeys: String, CodingKey {
//        case junre = "ジャンル"
//        case location = "場所"
//        case time = "時間"
//    }
}

struct SpotInfo: Decodable{
    let junre: String
    let location: String
    let lat: String //緯度
    let lon: String //経度
    let time: Double
    
    let placeId: String
    let placeName: String
    let address: String
    let photoReference: String
    let image: String
    
    let description: String
    
}

struct ChatGPTResponse: Codable {
    var id: String
    var object: String
    var created: Int
    var model: String
    var choices: [Choice]
    var usage: Usage
    
    struct Choice: Codable {
        var index: Int
        var finish_reason: String
        var message: Message
        //var messages: [Message]?
        
        struct Message: Codable {
            var role: String
            var content: String
        }
    }
    
    struct Usage: Codable {
        var prompt_tokens: Int
        var completion_tokens: Int
        var total_tokens: Int
    }
}
