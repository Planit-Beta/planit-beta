
import Foundation
import SwiftUI
import Alamofire

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

final class ViewModel: ObservableObject {
    let searchPlace = SearchPlace()
    
    var csvArray: [String] = []
    @State var APIArray: [String] = []
    
    @Published public var messages: [Message] = []
    @Published public var isAsking: Bool = false
    @Published public var errorText: String = ""
    @Published public var showAlert = false
    @Published public var visitSpots: [Spot] = []
    @Published public var foodType: String = "和食"
    @Published public var SpotInfos: [SpotInfo] = []
    
    @Published public var isShowModal: Bool = false
    
    @Published public var option: Option = Option(start: "", time: "0", withWho: "", detail1: "", detail2: "インスタ映え", detail3: "人気", foodType: "", season: "")
    
    @Published public var selectedOptions: [String] = ["インスタ映え", "人気"]
    
    
    private var token: String = ""
    
    private let setting: Message? = Message(
        content: "#出力形式データは次の形式で返してください。{ \"out\":[ {\"junre\": 文字列, \"location\": 文字列, \"lat\": 文字列, \"lon\": 文字列, \"time\": 数字}, {\"junre\": 文字列, \"location\": 文字列, \"lat\": 文字列, \"lon\": 文字列, \"time\": 数字}, {\"junre\": 文字列, \"location\": 文字列, \"lat\": 文字列, \"lon\": 文字列, \"time\": 数字}, ...]}",
        role: .system
    )
    
    init(){
        self.csvArray = loadCSV(fileName: "API-TOKEN")
        print(csvArray)
        _APIArray = State(initialValue: self.csvArray[0].components(separatedBy: ","))
        print(APIArray[1])
        self.token = APIArray[1]
    }
    
    func loadCSV(fileName: String) -> [String] {
        var csvArray: [String] = []
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
        print("エラー")
        }
        return csvArray
    }
    
    public func askChatGPT(text: String) {
        if text.isEmpty { return }
        isAsking = true
        add(text: text, role: .user)
        send(text: text, foodType: foodType)
    }
    
    private func responseSuccess(data: ChatGPTResponse) {
        guard let message = data.choices.first?.message else { return }
        add(text: message.content, role: .assistant)
        sleep(5)
//        isAsking = false
        isShowModal = true
    }
    
    private func responseFailure(error: String) {
        errorText = error
        showAlert = true
        isAsking = false
    }
    
    private func add(text: String, role: Message.Role) {
        messages.append(.init(content: text, role: role))
    }
}



extension ViewModel {
    
    private func send(text: String, foodType: String) {
        let headers: HTTPHeaders = [
            "Content-type": "application/json",
            "Authorization":"Bearer \(token)"
        ]
        
        var messages = convertToMessages(text: text)
        if setting != nil {
            messages.insert(["content":setting!.content, "role":setting!.role.rawValue], at: 0)
        }
        let parameters: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": messages,
        ]

        AF.request(
            "https://api.openai.com/v1/chat/completions",
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: headers
        ).responseData(completionHandler: { response in
            
            switch response.result {
            case .success(let data):
                print(String(data: data, encoding: .utf8) ?? "No data")
                guard let res = try? JSONDecoder().decode(ChatGPTResponse.self, from: data) else {
                    self.responseFailure(error: "Decode error")
                    return
                }
                self.responseSuccess(data: res)
                
                if let jsonData = res.choices[0].message.content.data(using: .utf8) {
                    do {
                        let json = try! JSONDecoder().decode(VisitSpots.self, from: jsonData)
                        print(json)
                        json.out.forEach{
                            print($0)
                            if $0.junre == "観光" {
                                self.searchPlace.get_placeID(place_name: $0.location, latitude: $0.lat, longitude: $0.lon)
                                sleep(3)
                                let spot = SpotInfo(junre: $0.junre, location: $0.location, lat: $0.lat, lon: $0.lat, time: $0.time, placeId: self.searchPlace.placeId, placeName: self.searchPlace.placeName, address: self.searchPlace.address, photoReference: self.searchPlace.photoReference, image: self.searchPlace.image, description: self.searchPlace.description)
                                self.SpotInfos.append(spot)
                            }
                                else if $0.junre.contains("食") {
                                self.searchPlace.get_placeID(place_name: foodType, latitude: $0.lat, longitude: $0.lon)
                                sleep(3)
                                    let spot = SpotInfo(junre: $0.junre, location: $0.location, lat: $0.lat, lon: $0.lat, time: $0.time, placeId: self.searchPlace.placeId, placeName: self.searchPlace.placeName, address: self.searchPlace.address, photoReference: self.searchPlace.photoReference, image: self.searchPlace.image, description: self.searchPlace.description)
                                    self.SpotInfos.append(spot)
                                    print(self.SpotInfos)
                            }
                        }
                        
                    } catch {
                        print("Error converting string to JSON: \(error)")
                    }
                } else {
                    print("Invalid JSON string")
                }
                
//                let jsonData = res.choices[0].message.content.data(using: .utf8)!
//                let decoder = JSONDecoder()
//                let visitSpots = try! decoder.decode(VisitSpots.self, from: jsonData)
//                print(visitSpots)
                
            
                
                break
            case .failure(let error):
                self.responseFailure(error: error.localizedDescription)
                break
            }
        })
    }
    
    private func convertToMessages(text: String) -> [[String: String]] {
        return messages.map { ["content": $0.content, "role": $0.role.rawValue] }
    }
}
