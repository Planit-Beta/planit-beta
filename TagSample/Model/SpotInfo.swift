//
//  SpotInfo.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/06/01.
//

import Foundation

struct SpotInfo: Decodable{
    let junre: String
    let time: String
    let location: String
    let lat: String //緯度
    let lon: String //経度
    let other: String
    let description: String
    
    let placeId: String
    let placeName: String
    let address: String
    let photoReference: String
    let image: String
}

extension SpotInfo {
    func toDictionary() -> [String: Any] {
        return [
            "junre": junre,
            "time": time,
            "location": location,
            "lat": lat,
            "lon": lon,
            "other": other,
            "description": description,
            "placeId": placeId,
            "placeName": placeName,
            "address": address,
            "photoReference": photoReference,
            "image": image
        ]
    }
}
