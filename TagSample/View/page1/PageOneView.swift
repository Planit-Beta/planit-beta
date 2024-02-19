//
//  PageOneView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/02/17.
//

import SwiftUI

struct PageOneView: View {
    @Binding var inputName: String
    @Binding var inputDestination: String
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("行き先とそこに行きたい時間帯を入力してください").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Text("旅行名").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    
                    TextField("旅程名を入力してください", text: $inputName)
                        .padding()
                        .font(.custom("ZenMaruGothic-Regular", size: 15.0)).foregroundStyle(Color(UIColor(hexString: "333333"))).background(Color(UIColor(hexString: "D9D9D9")))
                        .cornerRadius(10)
                    
                }
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Text("行き先").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    
                    TextField("行き先を入力してください", text: $inputDestination)
                        .padding()
                        .font(.custom("ZenMaruGothic-Regular", size: 15.0)).foregroundStyle(Color(UIColor(hexString: "333333"))).background(Color(UIColor(hexString: "D9D9D9")))
                        .cornerRadius(10)
                    
                }
                Spacer()
                VStack(spacing: 10){
                    HStack{
                        Text("人気の行き先")
                            .font(.custom("ZenMaruGothic-Regular", size: 20.0))
                            .foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack (spacing: 0) {
                            ForEach(0 ..< 4) { i in
                                NavigationLink(
                                    destination: DetailScreen(),
                                    label: {
                                        ProductCardView(image: Image("sample_\(i+1)"), size: 210)
                                    })
                                .navigationBarHidden(true)
                                .foregroundColor(.black)
                            }
                            .padding(.trailing)
                        }
                    }
                    
                    
                    
                }
                Spacer()
            }
            
        }
//        .padding()
    }
}


struct PageOneView_Previews: PreviewProvider {
    static var previews: some View {
//        OnBoarding()
        PageOneView(inputName: .constant("京都旅行"), inputDestination:.constant("清水寺"))
    }
}
