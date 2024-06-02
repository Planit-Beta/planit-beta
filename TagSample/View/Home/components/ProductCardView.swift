//
//  ProductCardView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/06/02.
//

import SwiftUI


struct ProductCardView: View {
    var spots: [SpotInfo]
    let size: CGFloat
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: (spots[0].image.isEmpty ? (spots[1].image.isEmpty ? sampleImage[0] : spots[1].image) : spots[0].image))) { image in
                    image.resizable()
                    .scaledToFill()
                    .frame(width: size, height: 400)
                    .cornerRadius(20.0)
                    
                } placeholder: {
                    ProgressView()
                }
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.clear, .clear, .white.opacity(0.3), .white.opacity(0.7), .white.opacity(0.95)]), startPoint: .top, endPoint: .bottom).cornerRadius(20.0)
                )
                .overlay(
                    ZStack(){
                        VStack{
                            HStack{
                                Spacer()
                                Text(spots[0].junre == "移動" ? spots[1].location : spots[0].location)
                                    .font(.custom("ZenMaruGothic-Black", size: 24.0))
                                    .foregroundStyle(Color(UIColor(hexString: "FFFFFF")))
                                    .overlay(
                                        Text(spots[0].junre == "移動" ? spots[1].location : spots[0].location)
                                            .font(.custom("ZenMaruGothic-Regular", size: 24.0))
                                            .foregroundStyle(Color(UIColor(hexString: "333333")))
                                    )
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
                ).cornerRadius(20.0)
            
        }
        .frame(width: size)
        
    }
}
