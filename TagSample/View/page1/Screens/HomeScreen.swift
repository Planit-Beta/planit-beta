//
//  HomeScreen.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex: Int = 1
    
    var body: some View {
        NavigationView {
//            ZStack {
//                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
//                    .ignoresSafeArea()
                
//                ScrollView (showsIndicators: false) {
//                    VStack (alignment: .leading) {
                    
                        
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
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
        
                        
//                    }
//                }
//            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}


struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 210 * (size/210))
                .cornerRadius(20.0)
                .overlay(
                    VStack{
                        HStack{
                            Spacer()
                            Text("清水寺")
                                .font(.custom("ZenMaruGothic-Regular", size: 24.0))
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
            
            Text("日本の観光名所である京都内でも特に人気が高い清水寺。「音羽の滝」から流れ出る清らかな水にちなんで、清水寺という名前が付いています。清水寺が誕生したのは今から1,200年以上前の平安時代。810年に天皇公認のお寺になるなど、長きにわたって発展してきました。")
                .multilineTextAlignment(.leading)
                .font(.custom("ZenMaruGothic-Regular", size: 10.0))
                .foregroundStyle(Color(UIColor(hexString: "333333")))
        }
        .frame(width: size)
//        .padding()
//        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}

