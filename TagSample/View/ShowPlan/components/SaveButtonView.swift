//
//  SaveButtonView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/07.
//

import SwiftUI

struct SaveButtonView: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action){
            Text("確定する")
                .font(.custom("ZenMaruGothic-Medium", size: 14.0))
                .foregroundStyle(Color(UIColor(hexString: "FFFFFF")))
                .frame(width: 180, height: 40)
                .background(Color(UIColor(hexString: "F8714F")))
                .cornerRadius(20)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        }
        .padding(.vertical)
    }
}

//#Preview {
//    SaveButtonView()
//}
