//
//  View+Extension.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/06/01.
//

import SwiftUI

extension View { ///navigationViewの戻るボタン
    func customBackButton() -> some View {
        self.modifier(CustomBackButton())
    }
    
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
}
