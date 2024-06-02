//
//  OptionTagView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/06.
//

import SwiftUI

struct OptionTagView: View {
    var option: String
    var body: some View {
        Text(option).font(.custom("ZenMaruGothic-Regular", size: 14.0))
            .padding(7)
            .padding(.horizontal, 7)
            .foregroundStyle(Color(UIColor(hexString: "333333")))
            .background(Color(UIColor(hexString: "FFFFFF")))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    OptionTagView(option: "人気")
}
