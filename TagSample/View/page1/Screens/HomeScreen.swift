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
                                            ProductCardView(image: Image("sample_\(i+1)"), size: 250)
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
                .scaledToFill()
                .frame(width: size, height: 400)
                .cornerRadius(20.0)
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.clear, .clear, .white.opacity(0.3), .white.opacity(0.7), .white.opacity(0.95)]), startPoint: .top, endPoint: .bottom)
                )
                .overlay(
                    ZStack(){
                        VStack{
                            HStack{
                                Spacer()
                                Text("京都")
                                    .font(.custom("ZenMaruGothic-Regular", size: 24.0))
                                    .foregroundStyle(Color(UIColor(hexString: "333333")))
                            }
                            HStack(spacing: 10){
                                Spacer()
                                Text("季節")
                                    .font(.custom("ZenMaruGothic-Regular", size: 12.0))
                                    .foregroundStyle(Color(UIColor(hexString: "F4F4F4")))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 5)
                                    .background(Color(UIColor(hexString: "F8714F"))).cornerRadius(12)
                                
                                Text("所要時間")
                                    .font(.custom("ZenMaruGothic-Regular", size: 12.0))
                                    .foregroundStyle(Color(UIColor(hexString: "F4F4F4")))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 5)
                                    .background(Color(UIColor(hexString: "F8714F"))).cornerRadius(12)
                                
                            }
                        }.padding()
                    }
                    
                    ,alignment: .bottomTrailing
                )
            
        }
        .frame(width: size)
//        .padding()
//        .background(Color.white)
        
    }
}

