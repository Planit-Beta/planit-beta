//
//  DetailScreen.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 15/2/21.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var envData: EnvironmentData
    
    let spotInfo: [SpotInfo]
    var body: some View {
        ZStack{
            Color(UIColor(hexString: "FDF5F3"))
                .ignoresSafeArea()
            ScrollView{
                AsyncImage(url: URL(string: spotInfo[0].image)) { image in ///メイン画像
                    image.resizable().scaledToFill().frame(width: UIScreen.main.bounds.width, height: 300)
                    
                } placeholder: {
                    ProgressView()
                }
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 40,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 0
                    )
                )
                
                VStack(spacing: 30){
                    HStack{ ///日付
                        Text("2024.02.18").font(.custom("ZenMaruGothic-Medium", size: 32))
                        Spacer()
                    }
                    HStack{ ///　タグ４つ
                        OptionTagView(option: "一人で")
                        OptionTagView(option: "春")
                        OptionTagView(option: "歴史的建造物")
                        OptionTagView(option: "和食")
                        Spacer()
                    }
                    OperateButton() /// ボタン３つ
                }.padding().padding(.horizontal)
                
                VStack(spacing: 30){ ///旅程リスト
                    ForEach(spotInfo, id: \.address) { info in
                        SpotView(spot: info, sampleImage: [""])
                    }
                }.padding().padding(.bottom, 70)
            }
        }.ignoresSafeArea().navigationBarBackButtonHidden(true).toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
        .sheet(isPresented: $envData.isImplementingModal) {
            DevelopingView()
        }
    }
    
}
struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
