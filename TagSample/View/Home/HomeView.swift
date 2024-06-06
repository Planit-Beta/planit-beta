//
//  HomeView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/02/21.
//


import SwiftUI

struct HomeView: View {
    @State var isActive: Bool = false
    @ObservedObject private var firebaseAuthViewModel = FirebaseAuthViewModel.shared
    @ObservedObject private var firestoreViewModel = FirestoreViewModel.shared
    @ObservedObject private var publicDataViewModel = PublicDataViewModel.shared
    
    @State var isShowProfile: Bool = false
    @State var isEditImage: Bool = false
    
    var recommendSpotInfo: [[SpotInfo]] = [[SpotInfo(junre: "観光", time: "1.0", location: "京都御所", lat: "35.025857", lon: "35.025857", other: "営業時間: 17:30-21:30", description: "入り口で持ち物検査を受けた後、右手に休憩所があります。そこで御所の説明アプリをダウンロードする事が出来ます。宮内庁職員による無料の案内ツアーも実施されています。私は先に行かれていたツアーに途中から合流して案内して頂きましたが、非常にわかりやすく最初から聞きたかったと後悔しました。これから行かれる方は、少し待ってでもこのツアーに参加する事をおすすめします。", placeId: "ChIJDVAFLmUIAWAR9bs0H-yer6o", placeName: "京都御所", address: "京都市上京区京都御苑３", photoReference: "ATplDJYhZ8xPVXWKca-ebiPKfMyjmGOXTOzIKTs6RumL8T8TG1Wbq1E3s89zqfobSn1YcKyHAFBbHOcNhGwo8eC93e1C7hgQ3vEVr20J897ko1k2TvPD9dq-UFb8aAt-XIHV7MC0j-itGF-yvOmNGSaGIARVv-Usct2Y9CT4ofkEotv2D_PY", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJYhZ8xPVXWKca-ebiPKfMyjmGOXTOzIKTs6RumL8T8TG1Wbq1E3s89zqfobSn1YcKyHAFBbHOcNhGwo8eC93e1C7hgQ3vEVr20J897ko1k2TvPD9dq-UFb8aAt-XIHV7MC0j-itGF-yvOmNGSaGIARVv-Usct2Y9CT4ofkEotv2D_PY&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"), SpotInfo(junre: "食事", time: "1.0", location: "醍醐ラーメン", lat: "34.993018", lon: "34.993018", other: "営業時間: 17:30-21:30", description: "清水寺の境内にある飲食店です。\nお蕎麦や湯豆腐、夏にはかき氷等もあるみたいです。\n味は正直そこそこですが、良い景色を眺めながらお食事が楽しめます。", placeId: "ChIJVxpfY88IAWARUX1Gh4KKPeI", placeName: "滝の家", address: "京都市東山区清水１丁目３０２ 清水寺境内 音羽の滝の横", photoReference: "ATplDJZ-UA42N4WCVFP4TMEO3jkK4Pl6gZ2Yz5VCu8tbYR5Bc0BEVUQZe5pv8CoHT9vQQjP_XC9PhnVoSefs-KdCXqP2VXohU5eG4KhI_ihPf2djECgFR7ZwizCiSTz1ylcZlxbUWCy5h6RfhXDOB0VFzzwJnVGL4QfWpIMzOR5SoepAQ3Ov", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJZ-UA42N4WCVFP4TMEO3jkK4Pl6gZ2Yz5VCu8tbYR5Bc0BEVUQZe5pv8CoHT9vQQjP_XC9PhnVoSefs-KdCXqP2VXohU5eG4KhI_ihPf2djECgFR7ZwizCiSTz1ylcZlxbUWCy5h6RfhXDOB0VFzzwJnVGL4QfWpIMzOR5SoepAQ3Ov&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"), SpotInfo(junre: "観光", time: "1.0", location: "清水寺", lat: "34.994856", lon: "34.994856", other: "営業時間: 17:30-21:30", description: "京都でナンバーワンの観光名所です\nなのでいつでも大変な賑わいです\nインバウンドの海外からの観光客も大変に多いです\n清水寺道のバス停で降りて、清水坂を徒歩15分ほど上っていくと正面入口の仁王門につきます\nそこからはいってさらにいくと、西門や三重の塔がその先に、拝観料を納めるところがあります", placeId: "ChIJB_vchdMIAWARujTEUIZlr2I", placeName: "清水寺", address: "京都市東山区清水１丁目２９４", photoReference: "ATplDJYop_dk7AwirM7NTKsa8nAM9FBucwV_rYQdcsAbKKwWpUPUZrt6Ao8TjpUWDMWovL6Lw1Ow7rvmeowMolL1SEW1HdS-8GdpHgP9aH2qDjzGyaKidYRqPEd_9wcbfEH0zhIAoD97uRAZ8Sg3szbelaSilWxS4jEO9kE1xqSMol4JJtAy", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJYop_dk7AwirM7NTKsa8nAM9FBucwV_rYQdcsAbKKwWpUPUZrt6Ao8TjpUWDMWovL6Lw1Ow7rvmeowMolL1SEW1HdS-8GdpHgP9aH2qDjzGyaKidYRqPEd_9wcbfEH0zhIAoD97uRAZ8Sg3szbelaSilWxS4jEO9kE1xqSMol4JJtAy&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"), SpotInfo(junre: "観光", time: "1.0", location: "金閣寺", lat: "35.039462", lon: "35.039462", other: "営業時間: 17:30-21:30", description: "金閣寺は雨の日でも魅力的な場所です。\n雨の中でも金閣寺の美しさに感動しました。雨がかかった金箔が輝き、静かな雨の音が境内に響き渡りました。雨の日ならではの静寂と神秘的な雰囲気が、家族での訪問を特別なものにしました。境内には木々が雨に濡れて緑が鮮やかになり、風情がありました。雨天のため人出は少なく、のんびりとした時間を過ごすことができました。子供たちも雨の日ならではの金閣寺の雰囲気に興味津々でした。雨の日だからこそ味わえる金閣寺の神秘的な魅力に家族全員が満足しました。", placeId: "ChIJvUbrwCCoAWARX2QiHCsn5A4", placeName: "金閣寺", address: "京都市北区金閣寺町１", photoReference: "ATplDJbpD2Y9ZltNKIXidmcHZnFPEqV7NTvLHEqR5JJwQ8pL8kFiYLruB5JShvuG_ioyMWudOKsk4JzqXTUxxhuEKEUsexIglU3Y1Dj4greQXlEZDX1y1PxZ1qGAuA6av5Hw5rUQQpVAixIR-PDgUX0LUHCPVVrW288C-ctdVi9CvMYo-OoP", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJbpD2Y9ZltNKIXidmcHZnFPEqV7NTvLHEqR5JJwQ8pL8kFiYLruB5JShvuG_ioyMWudOKsk4JzqXTUxxhuEKEUsexIglU3Y1Dj4greQXlEZDX1y1PxZ1qGAuA6av5Hw5rUQQpVAixIR-PDgUX0LUHCPVVrW288C-ctdVi9CvMYo-OoP&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"), SpotInfo(junre: "食事", time: "1.0", location: "一乗寺駅周辺のラーメン屋", lat: "35.044646", lon: "35.044646", other: "営業時間: 17:30-21:30", description: "お料理の味はもちろんのことホスピタリティーも大変素晴らしくとても良い時間を過ごさせていただきました♪\n\nまた今回は2階のお座敷を利用させていただきましたが、お部屋の雰囲気もとても良くぜひ接待や会食などに利用させていただきたいと思いました😁", placeId: "ChIJ3WyNiRAIAWAR528DT51ng1g", placeName: "照月", address: "京都市左京区下鴨上川原町２４", photoReference: "ATplDJbXVDpUVJvK2rYEPG1DahvUqcXMvqAe3K_pG55vx66RFF4ROdJrActCK6mXeJ2cN9cDstT_W_N0LEiXgY8nMiQ0EYrv6kRxqFIgQ7w2gd_1lEp55TjNHcL_dYsZ0DkjbVSYi9PJZ6tqASVKHz41Mki32D0nBYkpmlXPYpD-OEFdxBPP", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJbXVDpUVJvK2rYEPG1DahvUqcXMvqAe3K_pG55vx66RFF4ROdJrActCK6mXeJ2cN9cDstT_W_N0LEiXgY8nMiQ0EYrv6kRxqFIgQ7w2gd_1lEp55TjNHcL_dYsZ0DkjbVSYi9PJZ6tqASVKHz41Mki32D0nBYkpmlXPYpD-OEFdxBPP&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk")], [SpotInfo(junre: "観光", time: "3.0", location: "ユニバーサル・スタジオ・ジャパン（USJ）", lat: "34.665442", lon: "34.665442", other: "営業時間: 17:30-21:30", description: "お目当てはスーパー・ニンテンドー・ワールド✨入口からもうマリオワールド全開！緑の土管でワープした先には、あのマリオの世界が😆パワーアップバンドはエリアの中で買うつもりでしたが、エリアの入口でも買えました。\n\n入場確約チケット【日曜日11:00】のみでエクスプレス・パスは購入しなかったので、マリオカートもヨッシー・アドベンチャーも最初から100分待ちでしたが😅待っている間も細部まで作り込まれた装飾や仕掛けが楽しませてくれるので、そこまで苦ではありませんでした。", placeId: "ChIJXeLVg9DgAGARqlIyMCX-BTY", placeName: "ユニバーサル・スタジオ・ジャパン", address: "大阪市此花区桜島２丁目１−３３", photoReference: "ATplDJYcW7sSj1nnfrA6S9OG7T4K1iak-eTty3KZQqoqMqO6_sR8h4m-SqJJVxhRH5BOzsSkaqMqnFHGqKsZ_-aivtL8yO6scSujKTF_a2fNXM8wYPiqFIH-D33nBZaebfMJEYyLI52_Rqhs2tCN5WKaHmrJBn_wRUyN_VDMaTa42Lk0S7JA", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJYcW7sSj1nnfrA6S9OG7T4K1iak-eTty3KZQqoqMqO6_sR8h4m-SqJJVxhRH5BOzsSkaqMqnFHGqKsZ_-aivtL8yO6scSujKTF_a2fNXM8wYPiqFIH-D33nBZaebfMJEYyLI52_Rqhs2tCN5WKaHmrJBn_wRUyN_VDMaTa42Lk0S7JA&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"), SpotInfo(junre: "食事",  time: "1.0", location: "心斎橋周辺", lat: "34.676285", lon: "34.676285", other: "営業時間: 17:30-21:30", description: "団体で利用。\n飲み放題4,000円のコースでしたが、満足度は高かったです。\n刺身などの食材勝負をせず、ほどほどの食材で美味しいお料理を出してくれます。けっか、味のバリエーションも多く、満足度につながりました。\n\n店員さんも感じがよく、料理が出るのも早い。", placeId: "ChIJIelxxBnnAGARw7EsYorkRf0", placeName: "山のしずく 旬菜家", address: "大阪市中央区南船場３丁目２−６ B1", photoReference: "ATplDJZ_Hk9ZLbfWwPLJP4Ji8yTpHmoX1RnjxWcdWf19kJp3Whz30O2I0Cp1WSV_leCelZ0-3BdSGVAjTc7hKQ2rC_iHf9CosRLut3tyUOdJ43gtQX4gsg7Oi8kN4AwzRMGAIbz5XjjBU_5M0ng4PEiVwV7Pk34Cj3upFfjvi4X6WdxFtCbC", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJZ_Hk9ZLbfWwPLJP4Ji8yTpHmoX1RnjxWcdWf19kJp3Whz30O2I0Cp1WSV_leCelZ0-3BdSGVAjTc7hKQ2rC_iHf9CosRLut3tyUOdJ43gtQX4gsg7Oi8kN4AwzRMGAIbz5XjjBU_5M0ng4PEiVwV7Pk34Cj3upFfjvi4X6WdxFtCbC&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"), SpotInfo(junre: "観光", time: "1.0", location: "道頓堀", lat: "34.668477", lon: "135.501007", other: "営業時間: 17:30-21:30", description: "団体で利用。\n飲み放題4,000円のコースでしたが、満足度は高かったです。\n刺身などの食材勝負をせず、ほどほどの食材で美味しいお料理を出してくれます。けっか、味のバリエーションも多く、満足度につながりました。\n\n店員さんも感じがよく、料理が出るのも早い。", placeId: "ChIJg2DcJhXnAGARCbeAHoZrPeQ", placeName: "道頓堀", address: "大阪市中央区南船場３丁目２−６ B1", photoReference: "", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJYMTRFuwEGiVYnr2iG8UfwBJDM58hGiW6nXbwVgLHhp9j4PmmMgenvcHOjjmRbKRS5--Tm3RNaNlnWPyNz2BsZi4G7W-DYrsUwl4KRYhwUmadhSkMNtuxUtNnYfzkr2X2rY-h0NXC07jRzyHFs_DfYAd7NKMxDG4-pJ7CEOe9m8pEyZ&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk")]]
    
    

    var recommendPlans = [
        Plan(id: "1MRgNEdkkF035v4fAHFP", uid: "kNeHhJCcNsNwMSycCNqUZ15Hl153", date: "2024.05.09", plan: [TagSample.SpotInfo(junre: "観光", time: "9:00-11:00", location: "伏見稲荷大社", lat: "34.9671", lon: "135.7715", other: "入場無料", description: "千本鳥居が有名", placeId: "ChIJIW0uPRUPAWAR6eI6dRzKGns", placeName: "伏見稲荷大社", address: "京都市伏見区深草藪之内町６８", photoReference: "AUGGfZkHdgtIrcjs14ymAqJ6WkOZl2nvNPh-PtGUYaoe7F383NEEdhUPLZJCXNMzU67FG_-1dWv2TBYL9ipZ6lAENyXBfzkY9aTexh8JpdPxiWfzWxko4T1wNH9HzXxCfymnNnbpbdc3-nmee5_mScciKIBHM8Q3A8WHrdjOA5MeYVkgytk2", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=AUGGfZkHdgtIrcjs14ymAqJ6WkOZl2nvNPh-PtGUYaoe7F383NEEdhUPLZJCXNMzU67FG_-1dWv2TBYL9ipZ6lAENyXBfzkY9aTexh8JpdPxiWfzWxko4T1wNH9HzXxCfymnNnbpbdc3-nmee5_mScciKIBHM8Q3A8WHrdjOA5MeYVkgytk2&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"), TagSample.SpotInfo(junre: "食事", time: "11:30-12:30", location: "一蘭 京都河原町店", lat: "35.0099", lon: "135.7631", other: "予算: 1000円程度", description: "ラーメンが人気のお店", placeId: "ChIJN427t4YIAWARzzOjjgGp0_Q", placeName: "京都和食だしKenzo", address: "京都市中京区下妙覚寺町１９２−１ オクトピア御池 1F", photoReference: "AUGGfZl3V8dpyXoFKgWCMBPNFJcLU05_hMJq2rqHJz4Y4R4t2TcJ6iHK-OkGjMHV2XIBU27Nikdafk-tdmAU17Nhux8lQvkcOOjri6MiIs2H05CviIMgsWG9U8RlWDJuyvrdpyIJOHnRma9zF_3OhmDwF2CZdaHHRRmPsiN9fkR9eVrFppT1", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=AUGGfZl3V8dpyXoFKgWCMBPNFJcLU05_hMJq2rqHJz4Y4R4t2TcJ6iHK-OkGjMHV2XIBU27Nikdafk-tdmAU17Nhux8lQvkcOOjri6MiIs2H05CviIMgsWG9U8RlWDJuyvrdpyIJOHnRma9zF_3OhmDwF2CZdaHHRRmPsiN9fkR9eVrFppT1&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"), TagSample.SpotInfo(junre: "観光", time: "13:30-15:00", location: "清水寺", lat: "34.9948", lon: "135.7850", other: "入場料: 400円", description: "京都のシンボル", placeId: "ChIJB_vchdMIAWARujTEUIZlr2I", placeName: "清水寺", address: "京都市東山区清水１丁目２９４", photoReference: "AUGGfZkvCH3zXC8VbxZpHlvP35Azou9ZonIOmxaIwh1xR-jkTsSxHBC90_LUpEoTifQ7zwGJVa8opiG0RTxfFcP25tbSnq8fC7mIGvcvQMC2oSqyGHXqy2nVD59NI5CAUk14X9SWO2khjAtNzo8V1NZZEjBV22bK_t--Ed-Osp8cTNluSBYe", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=AUGGfZkvCH3zXC8VbxZpHlvP35Azou9ZonIOmxaIwh1xR-jkTsSxHBC90_LUpEoTifQ7zwGJVa8opiG0RTxfFcP25tbSnq8fC7mIGvcvQMC2oSqyGHXqy2nVD59NI5CAUk14X9SWO2khjAtNzo8V1NZZEjBV22bK_t--Ed-Osp8cTNluSBYe&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"), TagSample.SpotInfo(junre: "移動", time: "15:30-16:00", location: "清水寺から二条城へ", lat: "35.0306", lon: "135.7450", other: "徒歩で移動", description: "清水寺から歴史を感じる二条城へ", placeId: "", placeName: "", address: "", photoReference: "", image: ""), TagSample.SpotInfo(junre: "観光", time: "16:30-18:00", location: "二条城", lat: "35.0318", lon: "135.7481", other: "入場料: 1000円", description: "徳川家康ゆかりの城", placeId: "", placeName: "", address: "", photoReference: "", image: ""), TagSample.SpotInfo(junre: "食事", time: "18:30-19:30", location: "村上商店", lat: "35.0116", lon: "135.7681", other: "予算: 1500円程度", description: "ラーメンの名店", placeId: "ChIJeY7gMJsIAWARNgMZDgSlaSc", placeName: "わかしろ", address: "京都市中京区橋弁慶町２１８", photoReference: "AUGGfZl3UfFxbmK60xMa8swuZNdfvarOvqvjFYgQMZF4pex9-oYQ2ib7jHeyI5yLSgoMty_DHkPjawPjdz8mbXF4fav9lNTY1NylpaRyDPg5H6qjanoYuHzLyEYeA-nF947i3sfW1ElgET6j5Rhl45589VNxbkW5c_1-6LUcOLgO2ziNJ2Ej", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=AUGGfZl3UfFxbmK60xMa8swuZNdfvarOvqvjFYgQMZF4pex9-oYQ2ib7jHeyI5yLSgoMty_DHkPjawPjdz8mbXF4fav9lNTY1NylpaRyDPg5H6qjanoYuHzLyEYeA-nF947i3sfW1ElgET6j5Rhl45589VNxbkW5c_1-6LUcOLgO2ziNJ2Ej&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk")]),
        Plan(id: "N37xXiTiElwAhGyobweV", uid: "kNeHhJCcNsNwMSycCNqUZ15Hl153", date: "2024.05.09", plan: [TagSample.SpotInfo(junre: "移動", time: "8:00-8:30", location: "大阪駅からユニバーサル・シティ駅へ", lat: "34.6937", lon: "135.5023", other: "JR電車", description: "大阪駅からのアクセス便利", placeId: "", placeName: "", address: "", photoReference: "", image: ""), TagSample.SpotInfo(junre: "観光", time: "9:00-12:00", location: "ユニバーサル・スタジオ・ジャパン", lat: "34.6654", lon: "135.4323", other: "入場料：大人(12歳以上) 7,800円", description: "世界中の人気キャラクターが集結", placeId: "ChIJXeLVg9DgAGARqlIyMCX-BTY", placeName: "ユニバーサル・スタジオ・ジャパン", address: "大阪市此花区桜島２丁目１−３３", photoReference: "AUGGfZmgP3g7cRwViuDTvNqj5MJeeKPy1OrP-ZODFzViufHhPiF9BM5qjQW6ojeZz83ozHjPerjgDx8R7lOk6dP5Oglpp4TXmaiPDi4NrnUeoF9mb1Lf7tcvhDgORcmCHmnOXqgWpK11eEWH70tlTJWjvkRIb8b1ZQ1LJ6-VxRbr4p5deEwD", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=AUGGfZmgP3g7cRwViuDTvNqj5MJeeKPy1OrP-ZODFzViufHhPiF9BM5qjQW6ojeZz83ozHjPerjgDx8R7lOk6dP5Oglpp4TXmaiPDi4NrnUeoF9mb1Lf7tcvhDgORcmCHmnOXqgWpK11eEWH70tlTJWjvkRIb8b1ZQ1LJ6-VxRbr4p5deEwD&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"), TagSample.SpotInfo(junre: "食事", time: "12:30-14:00", location: "ユニバーサル・シティウォーク大阪内の和食レストラン", lat: "34.6654", lon: "135.4323", other: "予算：1人1,500円程度", description: "ランチには和風料理を楽しめる", placeId: "ChIJF2ejPJHpAGARViawNnRqDGA", placeName: "隠れ家", address: "大阪市港区港晴３丁目２−１０", photoReference: "AUGGfZnPeM8JGFeEyuQTDsNvs7yQMJc3cUMGzDddsA9kLqtzVQxMp-NBswMpf13SjsPZEFSQbrsYsMG3vFA0NpF6tCaQd1CLvy9yD9BuIlnFanMREc92LhKh4urmqq5xB5OK5aR6mm4ngXVOZmeXaQquKNkDUEom-jOgaFm-VtBC9n7eiukI", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=AUGGfZnPeM8JGFeEyuQTDsNvs7yQMJc3cUMGzDddsA9kLqtzVQxMp-NBswMpf13SjsPZEFSQbrsYsMG3vFA0NpF6tCaQd1CLvy9yD9BuIlnFanMREc92LhKh4urmqq5xB5OK5aR6mm4ngXVOZmeXaQquKNkDUEom-jOgaFm-VtBC9n7eiukI&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"), TagSample.SpotInfo(junre: "移動", time: "14:30-15:00", location: "ユニバーサル・シティ駅から西九条駅へ", lat: "34.7026", lon: "135.4845", other: "JR電車", description: "便利なアクセスで移動可能", placeId: "", placeName: "", address: "", photoReference: "", image: ""), TagSample.SpotInfo(junre: "観光", time: "15:30-18:00", location: "天保山スカイタワー", lat: "34.6557", lon: "135.4120", other: "入場料：大人 700円", description: "大阪の夜景を一望できる", placeId: "", placeName: "", address: "", photoReference: "", image: ""), TagSample.SpotInfo(junre: "食事", time: "18:30-20:00", location: "シーフード和食レストラン", lat: "34.6501", lon: "135.4533", other: "予算：1人2,000円程度", description: "新鮮なシーフードを堪能できる", placeId: "ChIJFf-ibhTnAGAR8niEXTjCTGg", placeName: "歩楽", address: "大阪市港区池島１丁目３−１０ 銀島マンション", photoReference: "AUGGfZlHI7Mog_-phGcsQtMukvf8e0YblQVxvCF5qxm2-O3zg79Vs7Ojs4gr5aPa9DIZrp_JlLW1qHnJwzLMlieRL0mg81I9y8dzr6LcZvutwa35esq-qO4mHJ7jYfaV7JA_sKle_XzCGXI6Br--CMr6lrA4lh2nYdPJK-lpV7A2Z8lz03Ez", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=AUGGfZlHI7Mog_-phGcsQtMukvf8e0YblQVxvCF5qxm2-O3zg79Vs7Ojs4gr5aPa9DIZrp_JlLW1qHnJwzLMlieRL0mg81I9y8dzr6LcZvutwa35esq-qO4mHJ7jYfaV7JA_sKle_XzCGXI6Br--CMr6lrA4lh2nYdPJK-lpV7A2Z8lz03Ez&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"), TagSample.SpotInfo(junre: "移動", time: "20:30-21:00", location: "西九条駅から大阪駅へ", lat: "34.7026", lon: "135.4845", other: "JR電車", description: "日本橋方面への帰路", placeId: "", placeName: "", address: "", photoReference: "", image: "")])
    ]
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(UIColor(hexString: "FDF5F3"))
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false){
                    
                    VStack(spacing: 20){
                        HStack{
                            Button(action: {
                                isShowProfile = true
                            }){
                                VStack(alignment: .leading){
                                    Text(firestoreViewModel.users.count == 0 ? "" :  firestoreViewModel.users[0].name).font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                                    Text(firebaseAuthViewModel.getEmail())
                                        .font(.custom("ZenMaruGothic-Regular", size: 11.0)).foregroundStyle(Color(UIColor(hexString: "333333")).opacity(0.5))
                                }
                            }
                            
                            Spacer()
                            
                            Button(action:{
                                isEditImage = true
                            }){
                                if firestoreViewModel.users.count == 0 {
                                    ProgressView()
                                        .frame(width: 45, height: 45)
                                } else {
                                    if firestoreViewModel.users[0].image != "" {
                                        AsyncImage(url: URL(string: firestoreViewModel.users[0].image)) { image in
                                            image
                                                .resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 45, height: 45)
                                        .scaledToFit()
                                        .clipShape(Circle())
                                        
                                    } else {
                                        Image(systemName: "person.fill")
                                            .resizable()
                                            .foregroundColor(Color(UIColor(hexString: "F8714F")))
                                            .frame(width: 45, height: 45)
                                            .scaledToFit()
                                            .clipShape(Circle())
                                    }
                                }
                            }
                        }.padding(.horizontal).padding(.horizontal)
                        
                        Spacer()
                        
                        Button {
                            isActive = true
                            publicDataViewModel.isNavigationActive = $isActive
                        } label: {
                            Text("新しく旅程を生成する")
                                .font(.custom("ZenMaruGothic-Medium", size: 24.0))
                                .foregroundStyle(Color(UIColor(hexString: "FFFFFF")))
                                .frame(width: 320, height: 80)
                                .background(Color(UIColor(hexString: "F8714F")))
                                .cornerRadius(20)
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        }.padding(.top, 20)
                        
                        NavigationLink(destination: OnBoardingView(), isActive: $isActive) {
                            EmptyView()
                        }
                        
                        Spacer()
                        
                        if !firestoreViewModel.plans.isEmpty {
                            VStack{
                                HStack(){
                                    Text("自分の旅程").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                                    Spacer()
                                }.padding(.horizontal).padding(.horizontal)
                                PlansListView(plans: firestoreViewModel.plans)
                                    .onAppear(perform: {
                                        print(firestoreViewModel.plans.isEmpty)
                                    })
                            }
                            Spacer()
                        }
                        
                        VStack{
                            HStack(){
                                Text("おすすめの旅程").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                                Spacer()
                            }.padding(.horizontal).padding(.horizontal)
                            PlansListView(plans: recommendPlans)
                        }
                        Spacer()
                    }
                }
            }
            .onAppear(perform: {
                firestoreViewModel.fetchUsers(user_id: firebaseAuthViewModel.getUserID())
                firestoreViewModel.fetchPlans(user_id: firebaseAuthViewModel.getUserID())
            })
            .sheet(isPresented: $isEditImage) {
                EditImageView(isCloseModal: $isEditImage)
            }
            .sheet(isPresented: $isShowProfile) {
                EditProfileView(isCloseModal: $isShowProfile)
            }
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}


//struct HomeView_Preview: PreviewProvider {
//    static var previews: some View {
////        OnBoarding()
//        HomeView(inputName: .constant("京都旅行"), inputDestination:.constant("清水寺"))
//    }
//}

