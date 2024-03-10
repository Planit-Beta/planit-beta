//
//  SpotListView.swift
//  ChatGPTAPISample
//
//  Created by 濱野遥斗 on 2024/03/04.
//

import SwiftUI

struct SpotListView: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var envData: EnvironmentData

    var body: some View {
        ZStack{
            Color(UIColor(hexString: "FDF5F3"))
                .ignoresSafeArea()
            ScrollView{
                AsyncImage(url: URL(string: viewModel.SpotInfos[0].image)) { image in ///メイン画像
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
                        OptionTagView(option: viewModel.option.withWho)
                        OptionTagView(option: viewModel.option.season)
                        OptionTagView(option: viewModel.option.detail1)
                        OptionTagView(option: viewModel.option.foodType)
                        Spacer()
                    }
                    OperateButton() /// ボタン３つ
                }.padding().padding(.horizontal)
                
                VStack(spacing: 30){ ///旅程リスト
                    ForEach(viewModel.SpotInfos, id: \.address) { info in
                        if info.junre.contains("移動"){
                            TransportView(spot: info)
                        } else {
                            SpotView(spot: info)
                        }
                        
                    }
                }.padding()
                
                HStack{ ///確定ボタン
                    Spacer()
                    SaveButtonView(action: {envData.isNavigationActive.wrappedValue = false})
                    Spacer()
                }.padding(.top, 50).padding(.bottom, 70)
                
                
            }.ignoresSafeArea().navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SpotListView().environmentObject(ViewModel())
}
