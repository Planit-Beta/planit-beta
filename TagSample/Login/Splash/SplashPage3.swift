//
//  SplashPage3.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/27.
//

import SwiftUI

struct SplashPage3: View {
    var body: some View {
        ZStack{
            Color(UIColor(hexString: "FDF5F3")).ignoresSafeArea()
            
            VStack(spacing: 40){
//                Spacer()
                Image(decorative: "planit_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180)
                VStack(spacing: 10){
                    Text("あなたもPlanitを使って").foregroundStyle(.black).font(.custom("ZenMaruGothic-Medium", size: 16))
                    Text("最高の休日を").foregroundStyle(.black).font(.custom("ZenMaruGothic-Medium", size: 16))
                }
                
                VStack(spacing: 25){
                    ButtonView(action: {}, backColor: "FDF5F3", textColor: "333333", text: "ログイン")
                    ButtonView(action: {}, backColor: "FDF5F3", textColor: "333333", text: "Googleでログイン")
                    Divider().frame(width: 250).background(.black)
                    ButtonView(action: {}, backColor: "F8714F", textColor: "FFFFFF", text: "新規登録")
                }
                
            }
        }
    }
}

#Preview {
    SplashPage3()
}
