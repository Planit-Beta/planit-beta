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
                        viewModel.askChatGPT(text: "##作成要件\n・\(viewModel.option.time)時間分のスケジュールを[junre](観光、移動、食事)/[time](例:8:00-9:30)/[location](地名、店名など)/[other](入場料、予算、移動手段など)/[description](30字以内の簡単な解説)/[lat](locationの緯度)/[lon](locationの経度)の各項目について出力形式に基づいて日本語で出力。\n・観光地の地理的な位置関係も考慮して、移動もジャンルとして出力する。\n・食事のスケジュールは、具体的な店名を提案する。\n・移動のスケジュールは、10字以内でどこからどこまで移動するかをdescriptionで出力。 \n・スケジュールのポイントについて解説を出力する。\n・解説、予算、入場料、移動手段や移動時間について不確かな情報は出力しない。\n・正確な場所や営業時間、入場料などの詳細が不明な場合は、web検索して正確で具体的な情報を出力する \n・locationの緯度経度を出力する(福岡城の緯度経度など) \n\n#作成項目 \(viewModel.option.start)を出発に\(viewModel.option.time)時間分の予定を生成します。\(viewModel.option.detail1)を\(viewModel.option.withWho)過ごし、\(viewModel.option.detail2)や\(viewModel.option.detail3)スポットにも周りたいです。以下の条件を考慮し、行き先を選び、その行き先と食事を含んだ楽しめる予定を提案してください。予定の中でそこで過ごす時間も書いてください。なお、食事は昼食、夕食それぞれに関して、\(viewModel.option.foodType)を中心に選んでください。\n\n#出力形式 \n{ \"out\":[ {\"junre\": 文字列, \"time\": 文字列, \"location\": 文字列, \"other\": 文字列, \"description\": 文字列, \"lat\": 文字列, \"lon\": 文字列}, {\"junre\": 文字列, \"time\": 文字列, \"location\": 文字列, \"other\": 文字列, \"description\": 文字列, \"lat\": 文字列, \"lon\": 文字列} ,{\"junre\": 文字列, \"time\": 文字列,  \"location\": 文字列, \"other\": 文字列, \"description\": 文字列, \"lat\": 文字列, \"lon\": 文字列}, ...]}")
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

