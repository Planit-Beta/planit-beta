//
//  GoogleMapModel.swift
//  ChatGPTAPISample
//
//  Created by 濱野遥斗 on 2024/03/02.
//

import Foundation
import SwiftUI
import Combine

class GoogleMapViewModel: ObservableObject {
    static let shared = GoogleMapViewModel()
    
    @Published var placeId = ""
    @Published var placeName = ""
    @Published var address = ""
    @Published var photoReference = ""
    @Published var image = ""
    @Published var description = ""
    
    private var api_key = ""
    private var radius = "1000"
    
    private var cancellables = Set<AnyCancellable>()
    
    private init() {  // プライベートイニシャライザに変更
        self.loadAPIKey()
    }
    
    private func loadAPIKey() {
        if let csvArray = loadCSV(fileName: "API-TOKEN") {
            if csvArray.count > 1 {
                let APIArray = csvArray[1].components(separatedBy: ",")
                if APIArray.count > 1 {
                    self.api_key = APIArray[1]
                }
            }
        }
    }
    
    private func loadCSV(fileName: String) -> [String]? {
        guard let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv") else {
            return nil
        }
        
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: .utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            var csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
            return csvArray
        } catch {
            print("Error loading CSV: \(error.localizedDescription)")
            return nil
        }
    }
    
    func reset() {
        placeId = ""
        placeName = ""
        address = ""
        photoReference = ""
        image = ""
        description = ""
    }
    
    func get_placeID(place_name: String, latitude: String, longitude: String) {
        var urlComponents = URLComponents(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json")!
        let location = "\(latitude),\(longitude)"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "language", value: "ja"),
            URLQueryItem(name: "keyword", value: placeName),
            URLQueryItem(name: "radius", value: radius),
            URLQueryItem(name: "location", value: location),
            URLQueryItem(name: "key", value: api_key)
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: PlaceResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { placeResponse in
                if let place = placeResponse.results.first {
                    self.placeId = place.placeId
                    self.address = place.vicinity
                    self.place_detail(placeId: place.placeId, fields: "")
                }
            })
            .store(in: &cancellables)
    }
    
    private func place_detail(placeId: String, fields: String) {
        var urlComponents = URLComponents(string: "https://maps.googleapis.com/maps/api/place/details/json")!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "language", value: "ja"),
            URLQueryItem(name: "place_id", value: placeId),
            URLQueryItem(name: "fields", value: fields),
            URLQueryItem(name: "key", value: api_key)
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: Root.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { placeResponse in
                let placeDetail = placeResponse.result
                self.placeName = placeDetail.name
                if let photos = placeDetail.photos {
                    self.photoReference = photos[0].photoReference
                    self.get_image(photoReference: photos[0].photoReference)
                }
            })
            .store(in: &cancellables)
    }
    
    private func get_image(photoReference: String) {
        var urlComponents = URLComponents(string: "https://maps.googleapis.com/maps/api/place/photo")!
        
        let maxWidth = 400
        urlComponents.queryItems = [
            URLQueryItem(name: "maxwidth", value: "\(maxWidth)"),
            URLQueryItem(name: "photo_reference", value: photoReference),
            URLQueryItem(name: "key", value: api_key)
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        self.image = "\(request.url!.absoluteString)"
    }
}
   
