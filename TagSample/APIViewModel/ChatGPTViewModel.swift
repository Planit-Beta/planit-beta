import Foundation
import Alamofire
import SwiftUI

final class ChatGPTViewModel: ObservableObject {
    static let shared = ChatGPTViewModel()

    private init() {
        self.csvArray = loadCSV(fileName: "API-TOKEN")
        _APIArray = State(initialValue: self.csvArray[0].components(separatedBy: ","))
        self.token = APIArray[1]
    }

    let googleMapViewModel = GoogleMapViewModel.shared

    var csvArray: [String] = []
    @State var APIArray: [String] = []

    @Published public var messages: [Message] = []
    @Published public var isAsking: Bool = false
    @Published public var progressVal: Double = 0
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
        content: "{\"out\":[{\"junre\": 文字列, \"time\": 文字列, \"location\": 文字列, \"other\": 文字列, \"description\": 文字列, \"lat\": 文字列, \"lon\": 文字列}, {\"junre\": 文字列, \"time\": 文字列, \"location\": 文字列, \"other\": 文字列, \"description\": 文字列, \"lat\": 文字列, \"lon\": 文字列}, {\"junre\": 文字列, \"time\": 文字列, \"location\": 文字列, \"other\": 文字列, \"description\": 文字列, \"lat\": 文字列, \"lon\": 文字列}]}",
        role: .system
    )

    func reset() {
        messages = []
        isAsking = false
        errorText = ""
        showAlert = false
        visitSpots = []
        foodType = "和食"
        SpotInfos = []
        isShowModal = false
        option = Option(start: "", time: "0", withWho: "", detail1: "", detail2: "インスタ映え", detail3: "人気", foodType: "", season: "")
        selectedOptions = ["インスタ映え", "人気"]
    }

    func loadCSV(fileName: String) -> [String] {
        var csvArray: [String] = []
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: .utf8)
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

extension ChatGPTViewModel {

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
                        let json = try JSONDecoder().decode(VisitSpots.self, from: jsonData)
                        print(json.out.count)
                        json.out.forEach{
                            print($0)
                            if $0.junre.contains("観光") {
                                self.googleMapViewModel.get_placeID(place_name: $0.location, latitude: $0.lat, longitude: $0.lon)
                                sleep(5)
                                let spot = SpotInfo(junre: $0.junre, time: $0.time, location: $0.location, lat: $0.lat, lon: $0.lon, other: $0.other, description: $0.description, placeId: self.googleMapViewModel.placeId, placeName: self.googleMapViewModel.placeName, address: self.googleMapViewModel.address, photoReference: self.googleMapViewModel.photoReference, image: self.googleMapViewModel.image)
                                self.SpotInfos.append(spot)

                                self.googleMapViewModel.reset()
                            } else if $0.junre.contains("食") {
                                self.googleMapViewModel.get_placeID(place_name: foodType, latitude: $0.lat, longitude: $0.lon)

                                sleep(5)
                                let spot = SpotInfo(junre: $0.junre, time: $0.time, location: $0.location, lat: $0.lat, lon: $0.lon, other: $0.other, description: $0.description, placeId: self.googleMapViewModel.placeId, placeName: self.googleMapViewModel.placeName, address: self.googleMapViewModel.address, photoReference: self.googleMapViewModel.photoReference, image: self.googleMapViewModel.image)
                                self.SpotInfos.append(spot)
                                self.googleMapViewModel.reset()
                                    print(self.SpotInfos)
                            } else {
                                let spot = SpotInfo(junre: $0.junre, time: $0.time, location: $0.location, lat: $0.lat, lon: $0.lon, other: $0.other, description: $0.description, placeId: "", placeName: "", address: "", photoReference: "", image: "")
                                self.SpotInfos.append(spot)
                                self.googleMapViewModel.reset()
                                print(self.SpotInfos)
                            }
                            DispatchQueue.main.async {
                                self.progressVal += Double(100 / json.out.count)
                            }
                        }
                    } catch {
                        print("Error converting string to JSON: \(error)")
                    }
                } else {
                    print("Invalid JSON string")
                }

            case .failure(let error):
                self.responseFailure(error: error.localizedDescription)
            }
        })
    }

    private func convertToMessages(text: String) -> [[String: String]] {
        return messages.map { ["content": $0.content, "role": $0.role.rawValue] }
    }
}
