

import Foundation
import SwiftUI


struct VisitSpots:Codable{
    let out: [Spot]
}


struct Spot: Codable{
    let junre: String
    let location: String
    let time: String
    let lat: String //緯度
    let lon: String //経度
    let other: String
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

struct Message: Hashable {
    var content: String
    var role: Role
    
    enum Role: String {
        case system = "system"
        case user = "user"
        case assistant = "assistant"
    }
}

struct Option: Codable {
    var start: String
    var time: String
    var withWho: String
    var detail1: String //緯度
    var detail2: String //緯度
    var detail3: String //緯度
    var foodType: String //経度
    var season: String
}
