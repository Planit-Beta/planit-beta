//
//  SplashPage1.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/27.
//

import SwiftUI


struct SplashPage1: View {
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
                
                VStack(spacing: 30){
                    Spacer()
                    Text("旅程を生成しています…").foregroundStyle(.white).font(.custom("ZenMaruGothic-Regular", size: 20))
                    
                }.offset(CGSize(width: 0, height: -UIScreen.main.bounds.width/1.5/2))
            }
    }
}

#Preview {
    SplashPage1()
}
