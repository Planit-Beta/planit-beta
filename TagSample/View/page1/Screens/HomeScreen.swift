//
//  HomeScreen.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex: Int = 1
    
    var sampleSpotInfo: [[SpotInfo]] = [[SpotInfo(junre: "観光", location: "京都御所", lat: "35.025857", lon: "35.025857", time: 1.0, placeId: "ChIJDVAFLmUIAWAR9bs0H-yer6o", placeName: "京都御所", address: "京都市上京区京都御苑３", photoReference: "ATplDJYhZ8xPVXWKca-ebiPKfMyjmGOXTOzIKTs6RumL8T8TG1Wbq1E3s89zqfobSn1YcKyHAFBbHOcNhGwo8eC93e1C7hgQ3vEVr20J897ko1k2TvPD9dq-UFb8aAt-XIHV7MC0j-itGF-yvOmNGSaGIARVv-Usct2Y9CT4ofkEotv2D_PY", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJYhZ8xPVXWKca-ebiPKfMyjmGOXTOzIKTs6RumL8T8TG1Wbq1E3s89zqfobSn1YcKyHAFBbHOcNhGwo8eC93e1C7hgQ3vEVr20J897ko1k2TvPD9dq-UFb8aAt-XIHV7MC0j-itGF-yvOmNGSaGIARVv-Usct2Y9CT4ofkEotv2D_PY&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "入り口で持ち物検査を受けた後、右手に休憩所があります。そこで御所の説明アプリをダウンロードする事が出来ます。宮内庁職員による無料の案内ツアーも実施されています。私は先に行かれていたツアーに途中から合流して案内して頂きましたが、非常にわかりやすく最初から聞きたかったと後悔しました。これから行かれる方は、少し待ってでもこのツアーに参加する事をおすすめします。"), SpotInfo(junre: "食事", location: "醍醐ラーメン", lat: "34.993018", lon: "34.993018", time: 1.0, placeId: "ChIJVxpfY88IAWARUX1Gh4KKPeI", placeName: "滝の家", address: "京都市東山区清水１丁目３０２ 清水寺境内 音羽の滝の横", photoReference: "ATplDJZ-UA42N4WCVFP4TMEO3jkK4Pl6gZ2Yz5VCu8tbYR5Bc0BEVUQZe5pv8CoHT9vQQjP_XC9PhnVoSefs-KdCXqP2VXohU5eG4KhI_ihPf2djECgFR7ZwizCiSTz1ylcZlxbUWCy5h6RfhXDOB0VFzzwJnVGL4QfWpIMzOR5SoepAQ3Ov", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJZ-UA42N4WCVFP4TMEO3jkK4Pl6gZ2Yz5VCu8tbYR5Bc0BEVUQZe5pv8CoHT9vQQjP_XC9PhnVoSefs-KdCXqP2VXohU5eG4KhI_ihPf2djECgFR7ZwizCiSTz1ylcZlxbUWCy5h6RfhXDOB0VFzzwJnVGL4QfWpIMzOR5SoepAQ3Ov&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "清水寺の境内にある飲食店です。\nお蕎麦や湯豆腐、夏にはかき氷等もあるみたいです。\n味は正直そこそこですが、良い景色を眺めながらお食事が楽しめます。"), SpotInfo(junre: "観光", location: "清水寺", lat: "34.994856", lon: "34.994856", time: 1.0, placeId: "ChIJB_vchdMIAWARujTEUIZlr2I", placeName: "清水寺", address: "京都市東山区清水１丁目２９４", photoReference: "ATplDJYop_dk7AwirM7NTKsa8nAM9FBucwV_rYQdcsAbKKwWpUPUZrt6Ao8TjpUWDMWovL6Lw1Ow7rvmeowMolL1SEW1HdS-8GdpHgP9aH2qDjzGyaKidYRqPEd_9wcbfEH0zhIAoD97uRAZ8Sg3szbelaSilWxS4jEO9kE1xqSMol4JJtAy", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJYop_dk7AwirM7NTKsa8nAM9FBucwV_rYQdcsAbKKwWpUPUZrt6Ao8TjpUWDMWovL6Lw1Ow7rvmeowMolL1SEW1HdS-8GdpHgP9aH2qDjzGyaKidYRqPEd_9wcbfEH0zhIAoD97uRAZ8Sg3szbelaSilWxS4jEO9kE1xqSMol4JJtAy&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "京都でナンバーワンの観光名所です\nなのでいつでも大変な賑わいです\nインバウンドの海外からの観光客も大変に多いです\n清水寺道のバス停で降りて、清水坂を徒歩15分ほど上っていくと正面入口の仁王門につきます\nそこからはいってさらにいくと、西門や三重の塔がその先に、拝観料を納めるところがあります\nつまりそこまでは見学無料です\nしかし清水寺の見所の清水の舞台と音羽の滝はその先にあります\n是非拝観料を納めてその二つをみておくべきです\nそうしないと何を見にいったの？と後からみんなに言われることになるでしょう\n清水の舞台からの眺めは絶景です\nまた音羽の滝を体験することも良い思い出になると思います\n\nお帰りは清水坂をまた下って行きます\n同じ道では面白くないなら途中のY字交差点の手前に右手に入る路地のような下っていく狭い石段の坂道があります\nこれが三年坂という大変に有名な商店街になり、多くの土産物店や飲食店が並んでいます\nさらに進むと途中にまた右手に下っていく狭い石段の坂道が在ります\nこれは二年坂で、高台寺という有名なお寺やその先の八坂神社への近道になります\n三年坂を真っ直ぐいくと、京都を紹介する写真に必ず登場する八坂の塔があります\nさらに下って行くとやがて有名な大寺建仁寺や京都の一大繁華街の祇園に到着します\n\nこの参道商店街を見て歩くのも清水寺観光の大きな楽しみです\n\n食べ歩きのお店もたくさんあります"), SpotInfo(junre: "観光", location: "金閣寺", lat: "35.039462", lon: "35.039462", time: 1.0, placeId: "ChIJvUbrwCCoAWARX2QiHCsn5A4", placeName: "金閣寺", address: "京都市北区金閣寺町１", photoReference: "ATplDJbpD2Y9ZltNKIXidmcHZnFPEqV7NTvLHEqR5JJwQ8pL8kFiYLruB5JShvuG_ioyMWudOKsk4JzqXTUxxhuEKEUsexIglU3Y1Dj4greQXlEZDX1y1PxZ1qGAuA6av5Hw5rUQQpVAixIR-PDgUX0LUHCPVVrW288C-ctdVi9CvMYo-OoP", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJbpD2Y9ZltNKIXidmcHZnFPEqV7NTvLHEqR5JJwQ8pL8kFiYLruB5JShvuG_ioyMWudOKsk4JzqXTUxxhuEKEUsexIglU3Y1Dj4greQXlEZDX1y1PxZ1qGAuA6av5Hw5rUQQpVAixIR-PDgUX0LUHCPVVrW288C-ctdVi9CvMYo-OoP&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "金閣寺は雨の日でも魅力的な場所です。\n雨の中でも金閣寺の美しさに感動しました。雨がかかった金箔が輝き、静かな雨の音が境内に響き渡りました。雨の日ならではの静寂と神秘的な雰囲気が、家族での訪問を特別なものにしました。境内には木々が雨に濡れて緑が鮮やかになり、風情がありました。雨天のため人出は少なく、のんびりとした時間を過ごすことができました。子供たちも雨の日ならではの金閣寺の雰囲気に興味津々でした。雨の日だからこそ味わえる金閣寺の神秘的な魅力に家族全員が満足しました。"), SpotInfo(junre: "食事", location: "一乗寺駅周辺のラーメン屋", lat: "35.044646", lon: "35.044646", time: 1.0, placeId: "ChIJ3WyNiRAIAWAR528DT51ng1g", placeName: "照月", address: "京都市左京区下鴨上川原町２４", photoReference: "ATplDJbXVDpUVJvK2rYEPG1DahvUqcXMvqAe3K_pG55vx66RFF4ROdJrActCK6mXeJ2cN9cDstT_W_N0LEiXgY8nMiQ0EYrv6kRxqFIgQ7w2gd_1lEp55TjNHcL_dYsZ0DkjbVSYi9PJZ6tqASVKHz41Mki32D0nBYkpmlXPYpD-OEFdxBPP", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJbXVDpUVJvK2rYEPG1DahvUqcXMvqAe3K_pG55vx66RFF4ROdJrActCK6mXeJ2cN9cDstT_W_N0LEiXgY8nMiQ0EYrv6kRxqFIgQ7w2gd_1lEp55TjNHcL_dYsZ0DkjbVSYi9PJZ6tqASVKHz41Mki32D0nBYkpmlXPYpD-OEFdxBPP&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "お料理の味はもちろんのことホスピタリティーも大変素晴らしくとても良い時間を過ごさせていただきました♪\n\nまた今回は2階のお座敷を利用させていただきましたが、お部屋の雰囲気もとても良くぜひ接待や会食などに利用させていただきたいと思いました😁")], [SpotInfo(junre: "観光", location: "ユニバーサル・スタジオ・ジャパン（USJ）", lat: "34.665442", lon: "34.665442", time: 3.0, placeId: "ChIJXeLVg9DgAGARqlIyMCX-BTY", placeName: "ユニバーサル・スタジオ・ジャパン", address: "大阪市此花区桜島２丁目１−３３", photoReference: "ATplDJYcW7sSj1nnfrA6S9OG7T4K1iak-eTty3KZQqoqMqO6_sR8h4m-SqJJVxhRH5BOzsSkaqMqnFHGqKsZ_-aivtL8yO6scSujKTF_a2fNXM8wYPiqFIH-D33nBZaebfMJEYyLI52_Rqhs2tCN5WKaHmrJBn_wRUyN_VDMaTa42Lk0S7JA", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJYcW7sSj1nnfrA6S9OG7T4K1iak-eTty3KZQqoqMqO6_sR8h4m-SqJJVxhRH5BOzsSkaqMqnFHGqKsZ_-aivtL8yO6scSujKTF_a2fNXM8wYPiqFIH-D33nBZaebfMJEYyLI52_Rqhs2tCN5WKaHmrJBn_wRUyN_VDMaTa42Lk0S7JA&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "お目当てはスーパー・ニンテンドー・ワールド✨入口からもうマリオワールド全開！緑の土管でワープした先には、あのマリオの世界が😆パワーアップバンドはエリアの中で買うつもりでしたが、エリアの入口でも買えました。\n\n入場確約チケット【日曜日11:00】のみでエクスプレス・パスは購入しなかったので、マリオカートもヨッシー・アドベンチャーも最初から100分待ちでしたが😅待っている間も細部まで作り込まれた装飾や仕掛けが楽しませてくれるので、そこまで苦ではありませんでした。"), SpotInfo(junre: "食事", location: "心斎橋周辺", lat: "34.676285", lon: "34.676285", time: 1.0, placeId: "ChIJIelxxBnnAGARw7EsYorkRf0", placeName: "山のしずく 旬菜家", address: "大阪市中央区南船場３丁目２−６ B1", photoReference: "ATplDJZ_Hk9ZLbfWwPLJP4Ji8yTpHmoX1RnjxWcdWf19kJp3Whz30O2I0Cp1WSV_leCelZ0-3BdSGVAjTc7hKQ2rC_iHf9CosRLut3tyUOdJ43gtQX4gsg7Oi8kN4AwzRMGAIbz5XjjBU_5M0ng4PEiVwV7Pk34Cj3upFfjvi4X6WdxFtCbC", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJZ_Hk9ZLbfWwPLJP4Ji8yTpHmoX1RnjxWcdWf19kJp3Whz30O2I0Cp1WSV_leCelZ0-3BdSGVAjTc7hKQ2rC_iHf9CosRLut3tyUOdJ43gtQX4gsg7Oi8kN4AwzRMGAIbz5XjjBU_5M0ng4PEiVwV7Pk34Cj3upFfjvi4X6WdxFtCbC&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "団体で利用。\n飲み放題4,000円のコースでしたが、満足度は高かったです。\n刺身などの食材勝負をせず、ほどほどの食材で美味しいお料理を出してくれます。けっか、味のバリエーションも多く、満足度につながりました。\n\n店員さんも感じがよく、料理が出るのも早い。"), SpotInfo(junre: "観光", location: "道頓堀", lat: "34.668477", lon: "135.501007", time: 1.0, placeId: "ChIJg2DcJhXnAGARCbeAHoZrPeQ", placeName: "道頓堀", address: "大阪市中央区南船場３丁目２−６ B1", photoReference: "", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJYMTRFuwEGiVYnr2iG8UfwBJDM58hGiW6nXbwVgLHhp9j4PmmMgenvcHOjjmRbKRS5--Tm3RNaNlnWPyNz2BsZi4G7W-DYrsUwl4KRYhwUmadhSkMNtuxUtNnYfzkr2X2rY-h0NXC07jRzyHFs_DfYAd7NKMxDG4-pJ7CEOe9m8pEyZ&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk", description: "団体で利用。\n飲み放題4,000円のコースでしたが、満足度は高かったです。\n刺身などの食材勝負をせず、ほどほどの食材で美味しいお料理を出してくれます。けっか、味のバリエーションも多く、満足度につながりました。\n\n店員さんも感じがよく、料理が出るのも早い。")]]
    
    var body: some View {
        
        ScrollView (.horizontal, showsIndicators: false) {
            HStack (spacing: 0) {
                ForEach(sampleSpotInfo.indices) { i in
                    NavigationLink(
                        destination: DetailScreen(spotInfo: sampleSpotInfo[i]),
                        label: {
                            ProductCardView(spots: sampleSpotInfo[i], size: 250)
                        })
                    .navigationBarHidden(true)
                    .foregroundColor(.black)
                    .padding(.leading, i == 0 ? 15 : 0)
                }
                .padding(.leading)
            }
        }
        .padding(.bottom)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}


struct ProductCardView: View {
    var spots: [SpotInfo]
    let size: CGFloat
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: spots[0].image)) { image in
                    image.resizable()
                    .scaledToFill()
                    .frame(width: size, height: 400)
                    .cornerRadius(20.0)
                    
                } placeholder: {
                    ProgressView()
                }
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.clear, .clear, .white.opacity(0.3), .white.opacity(0.7), .white.opacity(0.95)]), startPoint: .top, endPoint: .bottom)
                )
                .overlay(
                    ZStack(){
                        VStack{
                            HStack{
                                Spacer()
                                Text(spots[0].placeName)
                                    .font(.custom("ZenMaruGothic-Black", size: 24.0))
                                    .foregroundStyle(Color(UIColor(hexString: "FFFFFF")))
                                    .overlay(
                                        Text(spots[0].placeName)
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
                )
            
        }
        .frame(width: size)
//        .padding()
//        .background(Color.white)
        
    }
}

