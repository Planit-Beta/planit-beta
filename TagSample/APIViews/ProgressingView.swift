//
//  ProgressView.swift
//  ChatGPTAPISample
//
//  Created by 濱野遥斗 on 2024/03/04.
//

import SwiftUI

struct ProgressingView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var progressVal = 0.0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView{
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
                    ProgressView(value: progressVal, total: 100)
                        .animation(.easeInOut, value: progressVal)//バーのアニメーション
                        .tint(Color(.white))//バーの色
                        .background(Color(UIColor(hexString: "F8714F")))
                        .scaleEffect(x: 0.3, y: 2.5)//バーの高さ
                        .onReceive(timer, perform: { _ in
                            if progressVal < 100 {
                                progressVal += 1
                            }
                        })
                }.offset(CGSize(width: 0, height: -UIScreen.main.bounds.width/2/2))
                
                NavigationLink( ///旅程リストへ画面遷移
                    destination: SpotListView(),
                    isActive: $viewModel.isShowModal,
                    label: { EmptyView() }
                ).hidden()
            }
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    ProgressingView()
//}
