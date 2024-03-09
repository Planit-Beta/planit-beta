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
                        Text(spot.placeName)
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
//    SpotView(spot: SpotInfo(junre: "観光", location: "大阪城公園", lat: "34.6876", lon: "34.6876", time: 1.0, placeId: "ChIJVVVld8ngAGARi9mE-a6e9mc", placeName: "大阪城公園", address: "大阪市中央区大阪城１−１", photoReference: "ATplDJbJ-Cdc1QqAKg92sCZFkbi_ERec3Wxkxm7OvOZeggqdi9NjSIoaNUrura7mYnxgSk-SaYLHw1cX5j6zXXdrm_rR2prKI7q3exjaKM-fyBVCPYI9xY7NbKIZ0cB9tRJSkjBatGTdblKM2Q_UXj01MIkTMrOUIJVHlk8D-YHSelzOc666", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJbJ-Cdc1QqAKg92sCZFkbi_ERec3Wxkxm7OvOZeggqdi9NjSIoaNUrura7mYnxgSk-SaYLHw1cX5j6zXXdrm_rR2prKI7q3exjaKM-fyBVCPYI9xY7NbKIZ0cB9tRJSkjBatGTdblKM2Q_UXj01MIkTMrOUIJVHlk8D-YHSelzOc666&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "JR環状線🚃♻️「大阪城公園駅」と直結🙋\nあと、JR🚃♻️・Osaka Metro🚇️「森ノ宮駅」からや京阪🚞・Osaka Metro🚇️「天満橋駅」、Osaka Metro🚇｢谷町四丁目駅｣からなど(他の鉄道、他の駅から)も🚶💦可👌\nお城🏯の他、公園内には色々な施設が入っており特に「大阪城ホール」は一流アーティストなどの大きなイベントが開催されていることで有名ですね🎶🥰\n勿論、国内外の観光客がお城🏯目当てに押し寄せ来ますが🚙💨が、広大敷地内でグルメ🍴🍻🍜🍰🍩🍮✨・スポーツ⚾️🎾・ジョギング🏃・散歩🐶など…を楽しまれている地元の方も大勢おられます🙋\n天気の良い日🌞にはリバークルーズ🚢やお堀巡り🚢も良いですね‼️🤗"))
//}
