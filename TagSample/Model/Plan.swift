//
//  Plan.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/04/28.
//
import Foundation

struct Plan: Identifiable{
    var id: String
    var uid: String
    var date: String
    var plan: [SpotInfo]
    
    init(id: String, uid: String, date: String, plan: [SpotInfo]) {
        self.id = id
        self.uid = uid
        self.date = date
        self.plan = plan
    }
}
