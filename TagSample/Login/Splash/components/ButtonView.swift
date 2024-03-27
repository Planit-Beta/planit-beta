//
//  ButtonView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/27.
//

import SwiftUI

struct ButtonView: View {
    let action: () -> Void
    let backColor: String
    let textColor: String
    let text: String
    var body: some View {
        Button(action: action){
            Text(text)
                .font(.custom("ZenMaruGothic-Medium", size: 14.0))
                .foregroundStyle(Color(UIColor(hexString: textColor)))
                .frame(width: 180, height: 40)
                .background(Color(UIColor(hexString: backColor)))
                .cornerRadius(20)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        }
//        .padding(.vertical)
    }
}

#Preview {
    ButtonView(action: {}, backColor: "F8714F", textColor: "FFFFFF", text: "ログイン")
}
