//
//  SplashView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/27.
//

import SwiftUI

struct SplashView: View {
    
    @State var offset: CGFloat = .zero
    @State var isShowBackBtn: Bool = false
    @State var isShowNextBtn: Bool = true
    @State private var progressVal = 0.0
    
    @State var inputName: String = ""//旅行名
    @State var inputDestination: String = ""//行き先
    
    @State var selection = 1
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottom){
                Color(UIColor(hexString: "FDF5F3")).ignoresSafeArea()
                VStack(spacing: 10){
//                    VStack(alignment: .leading){ ///画面上部のバー
//                        Text("新しく旅程を作成する").padding().font(.custom("ZenMaruGothic-Medium", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
//                        ProgressView(value: min(max(progressVal, 0.0), 100), total: 100)
//                            .animation(.easeInOut, value: progressVal)//バーのアニメーション
//                            .tint(Color(UIColor(hexString: "333333")))//バーの色
//                            .scaleEffect(x: 1, y: 0.5)//バーの高さ
//                    }
                    
                    Spacer()
                    
//                    ScrollView(showsIndicators: false){
                        VStack{
                            if selection == 1 {
                                SplashPage1()
//                                PageOneView(inputName: $inputName, inputDestination: $inputDestination)
                            } else if selection == 2 {
//                                PageTwoView()
                                
                            } else {
//                                PageThreeView()
                                
                            }
                            
                            
                        }
                        .padding()
                        .animation(.easeInOut, value: selection)
//                    }
                    
                    
                }
                HStack(spacing: 50) {///画面下部の矢印ボタン
                    Spacer()
                    Button {
                        backToPriveousPage()
                        progressVal -= 50
                        selection -= 1
                    } label: {
                        Image(systemName: "arrowtriangle.backward.fill")
                            .foregroundColor(Color(UIColor(hexString: "FDF5F3")))
                            .font(.system(size: 50))
                        
                    }
                    .disabled(!isShowBackBtn)
                    .opacity(isShowBackBtn ? 1 : 0)
                    .animation(.easeInOut, value: getIndex())
                    
                    HStack(spacing: 20) {
                        ForEach(0..<3, id: \.self) { index in
                            
                            Circle()
                                .fill(Color(UIColor(hexString: index == selection-1 ? "FDF5F3" : "FFB3A0")))
                                .frame(width: 12, height: 12)
                                .scaleEffect(index == selection-1 ? 1.2 : 1)
                                .animation(.easeInOut, value: selection)
                        }
                    }
                    
                    
                    Button {
                        goToNextPage()
                        progressVal += 50
                        selection += 1
                    } label: {
                        Image(systemName: "arrowtriangle.forward.fill")
                            .foregroundColor(Color(UIColor(hexString: "FDF5F3")))
                            .font(.system(size: 50))
                        
                    }
                    .disabled(!isShowNextBtn)
                    .opacity(isShowNextBtn ? 1 : 0)
                    .animation(.easeInOut, value: getIndex())
                    Spacer()
                }
                .padding(.vertical, 40)

                
            }.ignoresSafeArea()
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
    
    
    func getIndex() -> Int {
        let process = offset / getScreenBounds().width
        return Int(process)
    }
    
    func goToNextPage() {
        let index = selection + 1
        if(index == 1){
            isShowBackBtn = false
            isShowNextBtn = true
        } else if (index == 3) {
            isShowNextBtn = false
            isShowBackBtn = true
        } else {
            isShowBackBtn = true
            isShowNextBtn = true
        }
    }
    
    func backToPriveousPage() {
        let index = selection - 1
        if(index == 1){
            isShowBackBtn = false
            isShowNextBtn = true
        } else if (index == 3) {
            isShowNextBtn = false
            isShowBackBtn = true
        } else {
            isShowBackBtn = true
            isShowNextBtn = true
        }
    }
}

#Preview {
    SplashView()
}
