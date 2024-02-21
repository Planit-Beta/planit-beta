//
//  PageThreeView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/02/18.
//

import SwiftUI

struct PageThreeView: View {
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
                        Text("現在時刻から4時間-6時間")
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
                    ToggleTagView(tags: $situation)
                }

                Spacer()
                
                Button {
                    
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
        }.padding()
    }
}


struct PageThreeView_Previews: PreviewProvider {
    static var previews: some View {
//        PageTwoView(inputName: .constant("京都旅行"), inputDestination:.constant("清水寺"))
        PageThreeView()
    }
}

