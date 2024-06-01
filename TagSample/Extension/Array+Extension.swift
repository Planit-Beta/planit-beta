//
//  Array+Extension.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/06/01.
//

import SwiftUI

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
