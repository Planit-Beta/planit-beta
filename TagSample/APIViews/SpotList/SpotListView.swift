//
//  SpotListView.swift
//  ChatGPTAPISample
//
//  Created by 濱野遥斗 on 2024/03/04.
//

import SwiftUI

struct SpotListView: View {
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string: viewModel.SpotInfos[0].image)) { image in ///メイン画像
                image.resizable().scaledToFill().frame(width: UIScreen.main.bounds.width, height: 240)
                    
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
                    Text("2024.02.18").font(.custom("", size: 32))
                    Spacer()
                }
                HStack{ ///　タグ４つ
                    Text(viewModel.option.withWho).font(.custom("ZenMaruGothic-Regular", size: 14.0))
                        .padding(7)
                        .padding(.horizontal, 7)
                        .foregroundStyle(Color(UIColor(hexString: "333333")))
                        .background(Color(UIColor(hexString: "F3ECEA")))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text(viewModel.option.season).font(.custom("ZenMaruGothic-Regular", size: 14.0))
                        .padding(7)
                        .padding(.horizontal, 7)
                        .foregroundStyle(Color(UIColor(hexString: "333333")))
                        .background(Color(UIColor(hexString: "F3ECEA")))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text(viewModel.option.detail1).font(.custom("ZenMaruGothic-Regular", size: 14.0))
                        .padding(7)
                        .padding(.horizontal, 7)
                        .foregroundStyle(Color(UIColor(hexString: "333333")))
                        .background(Color(UIColor(hexString: "F3ECEA")))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text(viewModel.option.foodType).font(.custom("ZenMaruGothic-Regular", size: 14.0))
                        .padding(7)
                        .padding(.horizontal, 7)
                        .foregroundStyle(Color(UIColor(hexString: "333333")))
                        .background(Color(UIColor(hexString: "F3ECEA")))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Spacer()
                }
                OperateButton() /// ボタン３つ
            }.padding().padding(.horizontal)
            
            VStack(spacing: 30){ ///旅程リスト
                ForEach(viewModel.SpotInfos, id: \.address) { info in
                    SpotView(spot: info)
                }
            }.padding().padding(.bottom, 70)
            
            
        }.ignoresSafeArea().navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SpotListView().environmentObject(ViewModel())
}
