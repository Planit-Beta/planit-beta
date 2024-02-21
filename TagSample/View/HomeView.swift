//
//  HomeView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/02/21.
//

import SwiftUI

struct HomeView: View {
    @Binding var inputName: String
    @Binding var inputDestination: String
    
    var body: some View {
            VStack(spacing: 10){
                VStack(spacing: 10){
                    Text("場所と時間を入力してください").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333"))).padding(.horizontal)
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
                        
                    }.padding(.horizontal)
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
                        
                    }.padding(.horizontal)
                    Spacer()
                }.padding(.horizontal)
//                Spacer()
                VStack(spacing: 10){
                    HStack{
                        Text("人気の行き先")
                            .font(.custom("ZenMaruGothic-Regular", size: 20.0))
                            .foregroundStyle(Color(UIColor(hexString: "333333")))
                            .padding(.horizontal).padding(.horizontal)
                        Spacer()
                    }
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack (spacing: 0) {
                            ForEach(0 ..< 4) { i in
                                let paddingValue: CGFloat = i == 0 ? 32 : 0
                                NavigationLink(
                                    destination: DetailScreen(),
                                    label: {
                                        ProductCardView(image: Image("sample_\(i+1)"), size: 210)
                                    })
                                .navigationBarHidden(true)
                                .foregroundColor(.black)
                                .padding(.leading, paddingValue)
                            }
                            .padding(.trailing)
                        }
                    }
                    
                    
                    
                }
                Spacer()
            }
            
        
    }
}


struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
//        OnBoarding()
        HomeView(inputName: .constant("京都旅行"), inputDestination:.constant("清水寺"))
    }
}

