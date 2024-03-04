//
//  SpotView.swift
//  ChatGPTAPISample
//
//  Created by 濱野遥斗 on 2024/03/03.
//

import SwiftUI

struct SpotView: View {
    var spot: SpotInfo
    
    var body: some View {
        HStack(alignment: .top, spacing: 0){
            VStack{
                Circle()
                    .fill(.orange)
                    .frame(width: 48, height: 48)
                    .padding(0)
                    .background(.white.shadow(.drop(color: .black.opacity(0.1), radius: 3)), in: .circle)
                    .offset(CGSize(width:10, height: 0.0))
                Rectangle()
                        .frame(width: 1, height: 102)
            }
            
            VStack(alignment: .leading, spacing: 8){
                HStack{
                    VStack(alignment: .leading, spacing: 5){
                        Text(spot.placeName)
                            .font(.custom("", size: 24))
                        HStack{
                            Text("人気").font(.custom("ZenMaruGothic-Regular", size: 10.0))
                                .padding(5)
                                .padding(.horizontal, 10)
                                .foregroundStyle(.black)
                                .background(.orange.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 9))
                            Text("人気").font(.custom("ZenMaruGothic-Regular", size: 10.0))
                                .padding(5)
                                .padding(.horizontal, 10)
                                .foregroundStyle(.black)
                                .background(.orange.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 9))
                        }
                        Text(spot.description)
                            .font(.custom("", size: 10))
                    }
                    
                    Spacer()
                    
                    VStack{
                        AsyncImage(url: URL(string: spot.image)) { image in
                                image.resizable()
                                
                            } placeholder: {
                                ProgressView()
                            }
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 20,
                                    bottomLeadingRadius: 5,
                                    bottomTrailingRadius: 5,
                                    topTrailingRadius: 5
                                )
                            )
                            .frame(width: 120, height: 94)
                        
                        Spacer()
                    }
                    
                    
                }.padding(5)
            }
            .padding(15)
            .frame(width: 330)
            .frame(maxHeight: 154)
            .background(.white, in: .rect(cornerRadius: 15))
            .offset(CGSize(width: -13.0, height: 25.0))
            .compositingGroup()
            .shadow(color: .black.opacity(0.25), radius: 3, x: 1, y: 1)
        }
    }
}

//#Preview {
//    SpotView()
//}
