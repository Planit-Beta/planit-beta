//
//  TransportView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/09.
//

import SwiftUI

struct TransportView: View {
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
                    .frame(width: 1, height: 60)
            }
            
            VStack(alignment: .leading, spacing: 8){
                HStack{
                    VStack(alignment: .leading, spacing: 5){
                        Text("\(spot.description)")
                            .font(.custom("ZenMaruGothic-Regular", size: 24)).foregroundStyle(Color(UIColor(hexString: "333333")))
                        
                        HStack{
                            Text(spot.other).font(.custom("ZenMaruGothic-Regular", size: 14.0))
                                .padding(5)
                                .padding(.horizontal, 15)
                                .foregroundStyle(Color(UIColor(hexString: "333333")))
                            Spacer()
                        }
                        .frame(width: 310)
                        .frame(maxHeight: 39)
                        .background(Color(UIColor(hexString: "F3ECEA")))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    
                }
                .padding(.horizontal, 5)
            }
            .padding(15)
            .frame(width: 330)
            .frame(maxHeight: 112)
            .background(.white, in: .rect(cornerRadius: 15))
            .offset(CGSize(width: -13.0, height: 25.0))
            .compositingGroup()
            .shadow(color: .black.opacity(0.25), radius: 3, x: 1, y: 1)
        }
    }
}

#Preview {
    TransportView(spot: SpotInfo(junre: "移動", time: "8:00-8:30", location: "大阪駅", lat: "34.702485", lon: "135.495951", other: "JR電車", description: "大阪駅から天保山へ", placeId: "", placeName: "", address: "", photoReference: "", image: ""))
}
