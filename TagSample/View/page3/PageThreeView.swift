//
//  PageThreeView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/02/18.
//

import SwiftUI

struct PageThreeView: View {
    @State private var pageTwoInputName: String = ""
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(spacing: 10){
                Text("こちらの内容でよろしいですか").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Text("行き先").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    
                    CardView(image: Image("sample_\(1)"), size: 210)
                }
                
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Text("シチュエーション")
                            .font(.custom("ZenMaruGothic-Regular", size: 20.0))
                            .foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    
                    TagForThreeView()
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("旅程を生成する")
                        .font(.custom("ZenMaruGothic-Regular", size: 24.0))
                        .foregroundStyle(Color(UIColor(hexString: "333333")))
                        .frame(width: 320, height: 80)
                        .background(Color(UIColor(hexString: "F5F5F5")))
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                }
                .padding(.vertical)
                
                Spacer()
            }
            
        }
        .padding()
    }
}


struct PageThreeView_Previews: PreviewProvider {
    static var previews: some View {
//        PageTwoView(inputName: .constant("京都旅行"), inputDestination:.constant("清水寺"))
        PageThreeView()
    }
}

