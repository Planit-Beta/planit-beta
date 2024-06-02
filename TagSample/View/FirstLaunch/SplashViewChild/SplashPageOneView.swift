//
//  SplashPage1.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/27.
//

import SwiftUI


struct SplashPageOneView: View {
    @State var progressVal = 0.0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Color(UIColor(hexString: "F8714F")).ignoresSafeArea()
                
            Circle().frame(width: 780).offset(CGSize(width: 0, height: -UIScreen.main.bounds.width/2 - 20)).foregroundColor(Color(UIColor(hexString: "FDF5F3")))
                
            Image(decorative: "splash")
                .resizable()
                .scaledToFit()
                .frame(width: 180)
                
            VStack(spacing: 10){
                Spacer()
                Text("予定生成アプリ").foregroundStyle(.white).font(.custom("ZenMaruGothic-Medium", size: 16))
                Text("Planitへようこそ！").foregroundStyle(.white).font(.custom("ZenMaruGothic-Medium", size: 16))
                    
            }.offset(CGSize(width: 0, height: -UIScreen.main.bounds.width/1.5/2))
        }
    }
}

#Preview {
    SplashPageOneView()
}
