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
                    .fill(Color(UIColor(hexString: "F8714F")))
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
                        Text(spot.location)
                            .font(.custom("ZenMaruGothic-Regular", size: 24)).foregroundStyle(Color(UIColor(hexString: "333333")))
                        
                        HStack{
                            Text("人気").font(.custom("ZenMaruGothic-Regular", size: 14.0))
                                .padding(5)
                                .padding(.horizontal, 10)
                                .foregroundStyle(Color(UIColor(hexString: "333333")))
                                .background(Color(UIColor(hexString: "F3ECEA")))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            Text("人気").font(.custom("ZenMaruGothic-Regular", size: 14.0))
                                .padding(5)
                                .padding(.horizontal, 10)
                                .foregroundStyle(Color(UIColor(hexString: "333333")))
                                .background(Color(UIColor(hexString: "F3ECEA")))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        Text(spot.other)
                            .font(.custom("ZenMaruGothic-Medium", size: 10))
                        Text(spot.description)
                            .font(.custom("ZenMaruGothic-Regular", size: 10))
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
                    
                    
                }
                .padding(.horizontal, 5)
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

#Preview {
    SpotView(spot: SpotInfo(junre: "食事", time: "11:30-13:00", location: "うどん 釜たか", lat: "34.674473", lon: "135.496462", other: "予算: 1000円程度", description: "大阪で評判の美味しいうどん専門店", placeId: "ChIJybE9OAXnAGARqzRawgI5pRE", placeName: "和顔", address: "大阪市西区北堀江１丁目６−１２ 四ッ橋中央ビル 1F", photoReference: "ATplDJbSQchChRseO69RZjJfmMDuaz799wxingOxeGzP7KltsviOotFq6L6XOrSeeH1Gd9VVtduOHu0X32RoMX3-48i-PdJQlZVVnbjBrbMYaiTjljT_DCxF52W9aqfQTgB7JdkriDL7A7qLfft11KQ7tbvG4lOBuuQD3MbLuRzcyzrt-ZXp", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJbSQchChRseO69RZjJfmMDuaz799wxingOxeGzP7KltsviOotFq6L6XOrSeeH1Gd9VVtduOHu0X32RoMX3-48i-PdJQlZVVnbjBrbMYaiTjljT_DCxF52W9aqfQTgB7JdkriDL7A7qLfft11KQ7tbvG4lOBuuQD3MbLuRzcyzrt-ZXp&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"))
}
