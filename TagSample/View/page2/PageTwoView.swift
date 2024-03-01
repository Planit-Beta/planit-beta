//
//  PageTwoView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/02/18.
//

import SwiftUI

var situationTags: [String] = ["一人で", "家族で", "友人と", "恋人と", "上司と", "大人数グループで"]

var seasonTags:  [String] = ["春", "夏", "秋", "冬"]
var tourTags:  [String] = ["屋内", "屋外", "歴史的建造物", "風景", "テーマパーク", "映えスポット"]
var foodTags:  [String] = ["和風", "中華", "ラーメン", "韓国料理", "洋食", "居酒屋"]
var snackTags:  [String] = ["コーヒー", "スイーツ", "食べ歩き"]

struct PageTwoView: View {
    @State private var pageTwoInputName: String = ""
    
    @State var situation: [Tag] = situationTags.map { Tag(name: $0) }
    @State var season: [Tag] = seasonTags.map { Tag(name: $0) }
    @State var tour: [Tag] = tourTags.map { Tag(name: $0) }
    @State var food: [Tag] = foodTags.map { Tag(name: $0) }
    @State var snack: [Tag] = snackTags.map { Tag(name: $0) }
    
    
    
    var body: some View {
        VStack(spacing: 10){
            VStack(spacing: 20){
                Text("その他の項目を選択してください").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Text("シチュエーション")
                            .font(.custom("ZenMaruGothic-Regular", size: 20.0))
                            .foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    
                    ToggleTagView(tags: $situation)
                }
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Text("季節")
                            .font(.custom("ZenMaruGothic-Regular", size: 20.0))
                            .foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    
                    ToggleTagView(tags: $season)
                }
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Text("観光")
                            .font(.custom("ZenMaruGothic-Regular", size: 20.0))
                            .foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    
                    ToggleTagView(tags: $tour)
                }
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Text("食事(しっかり)")
                            .font(.custom("ZenMaruGothic-Regular", size: 20.0))
                            .foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    
                    ToggleTagView(tags: $food)
                }
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Text("食事(軽食)")
                            .font(.custom("ZenMaruGothic-Regular", size: 20.0))
                            .foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    
                    ToggleTagView(tags: $snack)
                }
                Spacer()
                
                
            }.padding(.horizontal)
            
        }
        .padding()
    }
}


struct PageTwoView_Previews: PreviewProvider {
    static var previews: some View {
//        PageTwoView(inputName: .constant("京都旅行"), inputDestination:.constant("清水寺"))
        PageTwoView()
    }
}


struct CardView: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        HStack {
            image
                .resizable()
                .frame(width: size, height: 110 * (size/210))
                .cornerRadius(20.0)
                .overlay(
                    VStack{
                        HStack{
                            Spacer()
                            Text("清水寺")
                                .font(.custom("ZenMaruGothic-Regular", size: 16.0))
                                .foregroundStyle(Color(UIColor(hexString: "333333")))
                        }
                        HStack(spacing: 5){
                            Spacer()
                            ZStack{
                                Text("季節")
                                    .font(.custom("ZenMaruGothic-Regular", size: 12.0))
                                    .foregroundStyle(Color(UIColor(hexString: "F4F4F4")))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 2)
                            }.background(Color(UIColor(hexString: "4A4A4A"))).cornerRadius(12)
                            
                            ZStack{
                                Text("所要時間")
                                    .font(.custom("ZenMaruGothic-Regular", size: 12.0))
                                    .foregroundStyle(Color(UIColor(hexString: "F4F4F4")))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 2)
                            }.background(Color(UIColor(hexString: "4A4A4A"))).cornerRadius(12)
                        }
                    }.padding()
                    ,alignment: .bottomTrailing
                )
            
            VStack(alignment: .leading){
                Text("清水寺")
                    .font(.custom("ZenMaruGothic-Regular", size: 16.0))
                    .foregroundStyle(Color(UIColor(hexString: "333333")))
                Text("日本の観光名所である京都内でも特に人気が高い清水寺。「音羽の滝」から流れ出る清らかな水にちなんで、清水寺という名前が付いています。")
                    .multilineTextAlignment(.leading)
                    .font(.custom("ZenMaruGothic-Regular", size: 10.0))
                    .foregroundStyle(Color(UIColor(hexString: "333333")))
            }
        }
//        .frame(width: size)
//        .padding()
//        .background(Color.white)
//        .cornerRadius(20.0)
        
    }
}
