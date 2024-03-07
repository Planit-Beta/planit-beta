//
//  PageThreeView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/02/18.
//

import SwiftUI

struct PageThreeView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var pageTwoInputName: String = ""
    
    @State var situation: [Tag] = situationTags.map { Tag(name: $0) }
    
    var body: some View {
            VStack(spacing: 10){
                VStack(spacing: 20){
                    Text("その他の項目を選択してください").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                    Spacer()
                    
                    VStack(spacing: 25){
                        HStack(spacing: 20){
                            Text("場所")
                                .font(.custom("ZenMaruGothic-Regular", size: 20.0))
                                .opacity(0.5)
                                .foregroundStyle(Color(UIColor(hexString: "333333")))
                            Text("現在地から")
                                .font(.custom("ZenMaruGothic-Regular", size: 20.0))
                                .foregroundStyle(Color(UIColor(hexString: "333333")))
                            Spacer()
                        }
                        HStack(spacing: 20){
                            Text("時間")
                                .font(.custom("ZenMaruGothic-Regular", size: 20.0))
                                .opacity(0.5)
                                .foregroundStyle(Color(UIColor(hexString: "333333")))
                            Text("現在時刻から\(viewModel.option.time)時間")
                                .font(.custom("ZenMaruGothic-Regular", size: 20.0))
                                .foregroundStyle(Color(UIColor(hexString: "333333")))
                            Spacer()
                        }
                    }
                    Spacer()
                    
                    VStack(spacing: 10){
                        HStack{
                            Text("その他")
                                .font(.custom("ZenMaruGothic-Regular", size: 20.0))
                                .foregroundStyle(Color(UIColor(hexString: "333333")))
                            Spacer()
                        }
                        selectedTagView()
                    }
                    
                    Spacer()
                    
                    Button {
                        viewModel.askChatGPT(text: "# 作成項目 (\(viewModel.option.start)を出発に\(viewModel.option.time)時間分の予定を生成します。\(viewModel.option.detail1)を\(viewModel.option.withWho)過ごし、\(viewModel.option.detail2)や\(viewModel.option.detail3)スポットにも周りたいです。以下の条件を考慮し、行き先を選び、その行き先と食事を含んだ楽しめる予定を提案してください。予定の中でそこで過ごす時間も書いてください。なお、食事は昼食、夕食それぞれに関して、\(viewModel.option.foodType)を中心に選んでください。必ず出力形式を守り、レスポンスを返してくださいとして返してください。 ## 旅程の定義 - ジャンル 観光か食事か  - 場所 場所名、食事ならどこ周辺で食べるべきかだけ  - 緯度 場所で出力したところの緯度  - 経度 場所で出力したところの経度  - 時間 何時間過ごすのか")
                    } label: {
                        Text("旅程を生成する")
                            .font(.custom("ZenMaruGothic-Medium", size: 24.0))
                            .foregroundStyle(Color(UIColor(hexString: "FFFFFF")))
                            .frame(width: 320, height: 80)
                            .background(Color(UIColor(hexString: "F8714F")))
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    }
                    .padding(.vertical)
                    Spacer()
                    
                }.padding(.horizontal)
                
                NavigationLink(
                    destination: ProgressingView(),
                    isActive: $viewModel.isAsking,
                    label: { EmptyView() }
                ).hidden()
            }.padding()
        }
}


//struct PageThreeView_Previews: PreviewProvider {
//    static var previews: some View {
////        PageTwoView(inputName: .constant("京都旅行"), inputDestination:.constant("清水寺"))
//        PageThreeView()
//    }
//}

