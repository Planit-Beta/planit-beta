//
//  GoogleMapResponse.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/06/03.
//

import Foundation

struct PlaceResponse: Codable {
    let htmlAttributions: [String]
    let results: [Place]
    let status: String
    
    struct Place: Codable, Identifiable {
        let id = UUID()
        let placeId: String
        let types: [String]
        let vicinity: String
    }
}

struct Root: Codable {
    let result: PlaceDetail
    
    struct PlaceDetail: Codable {
        let name: String
        let photos: [Photo]?
        let reviews: [Review]?
        
        struct Photo: Codable {
            let photoReference: String
        }
        
        struct Review: Codable {
            let authorName: String
            let rating: Int
            let relativeTimeDescription: String
            let text: String
        }
    }
}
