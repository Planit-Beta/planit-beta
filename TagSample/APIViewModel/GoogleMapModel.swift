//
//  GoogleMapModel.swift
//  ChatGPTAPISample
//
//  Created by 濱野遥斗 on 2024/03/02.
//

import Foundation
import SwiftUI

struct Comment: Codable {
    var id: Int
    var name: String
    var email: String
    var body: String
}

struct PlaceResponse: Codable {
    let htmlAttributions: [String]
    let results: [Place]
    let status: String
}

struct Place: Codable, Identifiable {
    let id = UUID()
    let placeId: String
    let types: [String]
    let vicinity: String
}

struct Root: Codable {
    let result: PlaceDetail
}

struct PlaceDetail: Codable {
    let name: String
    let photos: [Photo]?
    let reviews: [Review]?
}

struct Photo: Codable {
    let photoReference: String
}

struct Review: Codable {
    let authorName: String
    let rating: Int
    let relativeTimeDescription: String
    let text: String
}

class SearchPlace:ObservableObject{
    var csvArray: [String] = []
    @State var APIArray: [String] = []
    
    @Published var api_key = ""
    @Published var radius = ""
    
    @Published var placeId = ""
    @Published var placeName = ""
    @Published var address = ""
    @Published var photoReference = ""
    @Published var image = ""
    @Published var description = ""
    
    init(){
        self.csvArray = loadCSV(fileName: "API-TOKEN")
//        print(csvArray)
        _APIArray = State(initialValue: self.csvArray[1].components(separatedBy: ","))
//        print(APIArray[1])
        self.api_key = APIArray[1]
        self.radius = "1000"//めーとる
    }
    
    func reset() {
        placeId = ""
        placeName = ""
        address = ""
        photoReference = ""
        image = ""
        description = ""
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
    
    func get_placeID(place_name :String,latitude:String,longitude:String){
        var urlComponents = URLComponents(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json")!
        
        let location = "\(latitude),\(longitude)"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "language", value: "ja"),
            URLQueryItem(name: "keyword", value: place_name),
            URLQueryItem(name: "radius", value: radius),
            URLQueryItem(name:"location",value: location),
            URLQueryItem(name: "key", value: api_key)
        ]
        let request = URLRequest(url: urlComponents.url!)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Invalid data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let placeResponse = try decoder.decode(PlaceResponse.self, from: data)
                
                if let places = placeResponse.results.first{
                    let placeId = places.placeId
                    let address = places.vicinity
                    let types = places.types
                    
                    self.placeId = placeId
                    self.address = address
                    
                    self.place_detail(place_id: placeId ,fields: "")
                    
                    print(place_name)
                    print("Place ID: \(placeId)")
                    print("Address: \(address)")
                    print("Types: \(types)")
                }
                print("--------------------")
                
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
        
    }
    
    func place_detail(place_id:String ,fields:String){
        var urlComponents = URLComponents(string: "https://maps.googleapis.com/maps/api/place/details/json")!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "language", value: "ja"),
            URLQueryItem(name: "place_id", value: place_id),
            URLQueryItem(name: "fields", value: fields),
            URLQueryItem(name: "key", value: api_key)
        ]
        let request = URLRequest(url: urlComponents.url!)
        print(request)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Invalid data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let placeResponse = try decoder.decode(Root.self, from: data)
                
                let placeDetail = placeResponse.result
                if let photos = placeDetail.photos {
                    self.photoReference = photos[0].photoReference
                    self.place_image(photoReference: photos[0].photoReference)
                }
                
                
                let placeName = placeDetail.name
                print("Place Name: \(placeName)")
                self.placeName = placeDetail.name
                
//                if let reviews = placeDetail.reviews { ///レビュー情報
//                    self.description = reviews[0].text
//                    print(self.description)
////                    for review in reviews {
////                       let authorName = review.authorName
////                       let rating = review.rating
////                       let relativeTime = review.relativeTimeDescription
////                       let text = review.text
////
////                       print("authorName \(authorName), Rating: \(rating), Time: \(relativeTime)")
////                       print("Text: \(text)")
////                       
////                       print("--------------------")
////                   }
//               }
                
//                if let reviews = placeDetail.reviews { ///レビュー情報
//                   for review in reviews {
//                       let authorName = review.authorName
//                       let rating = review.rating
//                       let relativeTime = review.relativeTimeDescription
//                       let text = review.text
//
//                       print("authorName \(authorName), Rating: \(rating), Time: \(relativeTime)")
//                       print("Text: \(text)")
//                       
//                       print("--------------------")
//                   }
//               }
                
                
                print("--------------------")
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
        
    }
    
    func place_image(photoReference: String){
        var urlComponents = URLComponents(string: "https://maps.googleapis.com/maps/api/place/photo")!
        
        let maxWidth = 400
        urlComponents.queryItems = [
            URLQueryItem(name: "maxwidth", value: "\(maxWidth)"),
            URLQueryItem(name: "photo_reference", value: photoReference),
            URLQueryItem(name: "key", value: api_key)
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        print("image: \(request)")
        self.image = "\(request)"
        
        
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                print("Error: \(error.localizedDescription)")
//                return
//            }
//            
//            guard let data = data else {
//                print("Invalid data")
//                return
//            }
//            
//            print(data)
//            if let image = UIImage(data: data) {
//                        // ここでがぞうしょり〜〜
//                        print("Fetched photo successfully")
//                    } else {
//                        print("Invalid photo data")
//                    }
//        }.resume()
        
    }
}
   
