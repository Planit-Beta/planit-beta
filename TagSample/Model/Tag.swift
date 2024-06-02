//
//  Tag.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/06/02.
//

import Foundation

struct Tag: Identifiable {
    var id = UUID().uuidString
    var name: String
    var isSelected: Bool = false
}
