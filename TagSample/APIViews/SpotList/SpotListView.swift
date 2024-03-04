//
//  SpotListView.swift
//  ChatGPTAPISample
//
//  Created by 濱野遥斗 on 2024/03/04.
//

import SwiftUI

struct SpotListView: View {
    @EnvironmentObject var viewModel: ViewModel
//    @State var spotInfos: [SpotInfo] = [SpotInfo(junre: "観光", location: "大阪城公園", lat: "34.6876", lon: "34.6876", time: 1.0, placeId: "ChIJVVVld8ngAGARi9mE-a6e9mc", placeName: "大阪城公園", address: "大阪市中央区大阪城１−１", photoReference: "ATplDJbJ-Cdc1QqAKg92sCZFkbi_ERec3Wxkxm7OvOZeggqdi9NjSIoaNUrura7mYnxgSk-SaYLHw1cX5j6zXXdrm_rR2prKI7q3exjaKM-fyBVCPYI9xY7NbKIZ0cB9tRJSkjBatGTdblKM2Q_UXj01MIkTMrOUIJVHlk8D-YHSelzOc666", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJbJ-Cdc1QqAKg92sCZFkbi_ERec3Wxkxm7OvOZeggqdi9NjSIoaNUrura7mYnxgSk-SaYLHw1cX5j6zXXdrm_rR2prKI7q3exjaKM-fyBVCPYI9xY7NbKIZ0cB9tRJSkjBatGTdblKM2Q_UXj01MIkTMrOUIJVHlk8D-YHSelzOc666&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "JR環状線🚃♻️「大阪城公園駅」と直結🙋\nあと、JR🚃♻️・Osaka Metro🚇️「森ノ宮駅」からや京阪🚞・Osaka Metro🚇️「天満橋駅」、Osaka Metro🚇｢谷町四丁目駅｣からなど(他の鉄道、他の駅から)も🚶💦可👌\nお城🏯の他、公園内には色々な施設が入っており特に「大阪城ホール」は一流アーティストなどの大きなイベントが開催されていることで有名ですね🎶🥰\n勿論、国内外の観光客がお城🏯目当てに押し寄せ来ますが🚙💨が、広大敷地内でグルメ🍴🍻🍜🍰🍩🍮✨・スポーツ⚾️🎾・ジョギング🏃・散歩🐶など…を楽しまれている地元の方も大勢おられます🙋\n天気の良い日🌞にはリバークルーズ🚢やお堀巡り🚢も良いですね‼️🤗"), SpotInfo(junre: "食事（昼食）", location: "串カツダイニング もり吉 心斎橋店", lat: "34.6726", lon: "34.6726", time: 1.0, placeId: "ChIJR6AGjhbnAGARQjvFUAb8c6E", placeName: "みな都", address: "大阪市中央区東心斎橋１丁目１５−２５", photoReference: "ATplDJYtLjPgIb54dyaqsr1ZtDRC1ZMgdf5jm77_g_gRPLp3Br-ZNVTJRwERF_gFKejUs7uVys2U0i_qyI5uKT2Iw-JBZcfdYybGtDRzx0XvDerTdXyg_Z9J9pxsh_rG3jbvPgy1IrGk7ST3gxQ5U6b3-hpVsrnFtb7cCBk6YsDcfsa8_QM", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJYtLjPgIb54dyaqsr1ZtDRC1ZMgdf5jm77_g_gRPLp3Br-ZNVTJRwERF_gFKejUs7uVys2U0i_qyI5uKT2Iw-JBZcfdYybGtDRzx0XvDerTdXyg_Z9J9pxsh_rG3jbvPgy1IrGk7ST3gxQ5U6b3-hpVsrnFtb7cCBk6YsDcfsa8_QM&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "材料が特別新鮮で、日本料理の基本出しがしっかりされたお店です。何を食べても薄塩で素材を生かした味付けです。何度も食べに訪れたいお店です。"), SpotInfo(junre: "観光", location: "道頓堀", lat: "34.6683", lon: "34.6683", time: 1.5, placeId: "ChIJg2DcJhXnAGARCbeAHoZrPeQ", placeName: "道頓堀", address: "大阪市", photoReference: "ATplDJYS_WmCjy76vPRbYljtp5XW0ugNhNUIwnjBZq6eN8qLZobjSH0w6iDR7kOkCoiw43GtITYjy0e5RR31Uyo8dbCRkJpzsc6imvmxd4OPDQybecMSktQEcieB68G4e7EVKhgjgyFwAq4VnHc6GwYIr3a1PrXsejOeQ6YEKKCZYfFnk7lI", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJYS_WmCjy76vPRbYljtp5XW0ugNhNUIwnjBZq6eN8qLZobjSH0w6iDR7kOkCoiw43GtITYjy0e5RR31Uyo8dbCRkJpzsc6imvmxd4OPDQybecMSktQEcieB68G4e7EVKhgjgyFwAq4VnHc6GwYIr3a1PrXsejOeQ6YEKKCZYfFnk7lI&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "材料が特別新鮮で、日本料理の基本出しがしっかりされたお店です。何を食べても薄塩で素材を生かした味付けです。何度も食べに訪れたいお店です。"), SpotInfo(junre: "観光", location: "通天閣", lat: "34.6528", lon: "34.6528", time: 1.0, placeId: "ChIJ_0Lgd2DnAGARV0X03lbPy-U", placeName: "通天閣", address: "大阪市浪速区恵美須東１丁目１８−６", photoReference: "ATplDJa7xLdxqZY0mQ6CLl9d4PjPhO8hdb7fd4L6HlxgVLJ59JVAh-RK6hjac4UT7uRxAJ7YK3bbv9FrcZGWPLXwexquxziROEnXtZjReqKVvbd1aFVs_LfLoYyL6Fo2LXpuZl36Gly5SA1Co7FqzyX8wna0_m4zNDifslnOTvERplzMDy90", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJa7xLdxqZY0mQ6CLl9d4PjPhO8hdb7fd4L6HlxgVLJ59JVAh-RK6hjac4UT7uRxAJ7YK3bbv9FrcZGWPLXwexquxziROEnXtZjReqKVvbd1aFVs_LfLoYyL6Fo2LXpuZl36Gly5SA1Co7FqzyX8wna0_m4zNDifslnOTvERplzMDy90&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "大阪と言えば、真っ先に映されるランドマークのような場所。一度は行きたいと思い、なんば駅近くの宿から歩いていきました。特徴のある建物が見えるとテンションもあがります。中ではアトラクションの滑り台？があって時々歓声があがってました。\n展望台までの待ち時間は約30分。休日の昼下がりとしては、早い方かもしれません。天気が良かったので見晴らしも言うことありません。柵だけの所もあり、思ったより高さを感じます。上に行くほど狭くなるので、混雑すると時間がかかりそうです。"), SpotInfo(junre: "食事（夕食）", location: "鉄板焼き ますだ", lat: "34.6742", lon: "34.6742", time: 0.5, placeId: "ChIJ6xgjMpDnAGARz1Cx9n5nSmg", placeName: "日本料理 閃", address: "大阪市中央区東心斎橋１丁目１７−２７ 7F ビル", photoReference: "ATplDJa7xLdxqZY0mQ6CLl9d4PjPhO8hdb7fd4L6HlxgVLJ59JVAh-RK6hjac4UT7uRxAJ7YK3bbv9FrcZGWPLXwexquxziROEnXtZjReqKVvbd1aFVs_LfLoYyL6Fo2LXpuZl36Gly5SA1Co7FqzyX8wna0_m4zNDifslnOTvERplzMDy90", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJa7xLdxqZY0mQ6CLl9d4PjPhO8hdb7fd4L6HlxgVLJ59JVAh-RK6hjac4UT7uRxAJ7YK3bbv9FrcZGWPLXwexquxziROEnXtZjReqKVvbd1aFVs_LfLoYyL6Fo2LXpuZl36Gly5SA1Co7FqzyX8wna0_m4zNDifslnOTvERplzMDy90&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "大阪と言えば、真っ先に映されるランドマークのような場所。一度は行きたいと思い、なんば駅近くの宿から歩いていきました。特徴のある建物が見えるとテンションもあがります。中ではアトラクションの滑り台？があって時々歓声があがってました。\n展望台までの待ち時間は約30分。休日の昼下がりとしては、早い方かもしれません。天気が良かったので見晴らしも言うことありません。柵だけの所もあり、思ったより高さを感じます。上に行くほど狭くなるので、混雑すると時間がかかりそうです。")]
    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string: viewModel.SpotInfos[0].image)) { image in ///メイン画像
                image.resizable().scaledToFill().frame(width: UIScreen.main.bounds.width, height: 240)
                    
                } placeholder: {
                    ProgressView()
                }
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 40,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 0
                    )
                )

            VStack(spacing: 30){
                HStack{ ///日付
                    Text("2024.02.18").font(.custom("", size: 32))
                    Spacer()
                }
                HStack{ ///　タグ４つ
                    Text(viewModel.option.withWho).font(.custom("ZenMaruGothic-Regular", size: 14.0))
                        .padding(7)
                        .padding(.horizontal, 10)
                        .foregroundStyle(Color(UIColor(hexString: "333333")))
                        .background(Color(UIColor(hexString: "F3ECEA")))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text(viewModel.option.season).font(.custom("ZenMaruGothic-Regular", size: 14.0))
                        .padding(5)
                        .padding(.horizontal, 10)
                        .foregroundStyle(Color(UIColor(hexString: "333333")))
                        .background(Color(UIColor(hexString: "F3ECEA")))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text(viewModel.option.detail1).font(.custom("ZenMaruGothic-Regular", size: 14.0))
                        .padding(5)
                        .padding(.horizontal, 10)
                        .foregroundStyle(Color(UIColor(hexString: "333333")))
                        .background(Color(UIColor(hexString: "F3ECEA")))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text(viewModel.option.foodType).font(.custom("ZenMaruGothic-Regular", size: 14.0))
                        .padding(5)
                        .padding(.horizontal, 10)
                        .foregroundStyle(Color(UIColor(hexString: "333333")))
                        .background(Color(UIColor(hexString: "F3ECEA")).opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Spacer()
                }
                OperateButton() /// ボタン３つ
            }.padding().padding(.horizontal)
            
            VStack(spacing: 30){ ///旅程リスト
                ForEach(viewModel.SpotInfos, id: \.address) { info in
                    SpotView(spot: info)
                }
            }.padding().padding(.bottom, 70)
            
            
        }.ignoresSafeArea().navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SpotListView().environmentObject(ViewModel())
}
