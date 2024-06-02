//
//  SplashPage2.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/27.
//

import SwiftUI

struct SplashPageTwoView: View {
//    @EnvironmentObject var viewModel: ViewModel
    @State var progressVal = 0.0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Color(UIColor(hexString: "F8714F")).ignoresSafeArea()
                
            Circle().frame(width: 780).offset(CGSize(width: 0, height: -UIScreen.main.bounds.width/2 - 20)).foregroundColor(Color(UIColor(hexString: "FDF5F3")))
                
            Image(decorative: "loadingImg")
                .resizable()
                .scaledToFit()
                .frame(width: 128)
                
            VStack(spacing: 10){
                Spacer()
                Text("あなたに合う最適な予定を").foregroundStyle(.white).font(.custom("ZenMaruGothic-Medium", size: 16))
                Text("AI生成によって提案します！").foregroundStyle(.white).font(.custom("ZenMaruGothic-Medium", size: 16))
                    
            }.offset(CGSize(width: 0, height: -UIScreen.main.bounds.width/1.5/2))
        }
    }
}

#Preview {
    SplashPageTwoView()
}

