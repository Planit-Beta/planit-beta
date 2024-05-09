//
//  EditImageView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/04/21.
//

import SwiftUI

struct EditImageView: View {
    @EnvironmentObject var dbViewModel: DBViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var image = UIImage()
    @State private var isShowPhotoLibrary = false
    
    @Binding var isCloseModal: Bool
    
    let spots = [
        SpotInfo(junre: "観光", time: "10:00-12:00", location: "大阪城公園", lat: "34.6873", lon: "135.5259", other: "入園料が必要", description: "歴史的な城跡を楽しめる。", placeId: "ChIJVVVld8ngAGARi9mE-a6e9mc", placeName: "大阪城公園", address: "大阪市中央区大阪城１−１", photoReference: "ATplDJbD-s6g9W44h-Vt721e2n77KlvdTBEMXVE2TxsXtqZORerRDNBydyi_UyN_rX9yvGUz4u1u1x9TtT09BniCoMAoljoscqYg2ePrmv1Gf9vBKsj-DHYC4yUSmTZmpjwWaSq4LQnoNkRfbSye_RT6I9GVnuffB60ApgLiYJtejTpzUBsb", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJbD-s6g9W44h-Vt721e2n77KlvdTBEMXVE2TxsXtqZORerRDNBydyi_UyN_rX9yvGUz4u1u1x9TtT09BniCoMAoljoscqYg2ePrmv1Gf9vBKsj-DHYC4yUSmTZmpjwWaSq4LQnoNkRfbSye_RT6I9GVnuffB60ApgLiYJtejTpzUBsb&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"),
        SpotInfo(junre: "食事", time: "12:30-13:30", location: "一蘭 心斎橋店", lat: "34.6749", lon: "135.5018", other: "予算：1000円程度", description: "人気の豚骨ラーメンを味わえる。", placeId: "ChIJK3io0wPnAGAR5XQyXJnzvl4", placeName: "日本料理 新町 和けい", address: "大阪市西区新町２丁目３−１３ 1F", photoReference: "ATplDJZiS3QtD0eYQN4gY0x2bOKGB9v57DmR2dpCih34Tz-f3dZW_hFFAlr4eQAvAzFcB6B2Ce7FyRXcd5jR9l2obwyGOgrNFZVKUxk-nZzyJSy3YfmYU0O1e45tUdbBKp2i8T6rOBpmrmjjtsNsgMZ_OjkuD9ZAFBdsxDVLkV4cB8Y79l8Q", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJZiS3QtD0eYQN4gY0x2bOKGB9v57DmR2dpCih34Tz-f3dZW_hFFAlr4eQAvAzFcB6B2Ce7FyRXcd5jR9l2obwyGOgrNFZVKUxk-nZzyJSy3YfmYU0O1e45tUdbBKp2i8T6rOBpmrmjjtsNsgMZ_OjkuD9ZAFBdsxDVLkV4cB8Y79l8Q&key=AIzaSyDCG_auCKmnxlyZUSgSI3TsYUFiWqIypWk"),
        SpotInfo(junre: "観光", time: "14:00-16:00", location: "通天閣", lat: "34.6526", lon: "135.5060", other: "展望台への入場料が必要", description: "大阪のシンボル的な観光スポット。", placeId: "ChIJ_0Lgd2DnAGARV0X03lbPy-U", placeName: "通天閣", address: "大阪市浪速区恵美須東１丁目１８−６", photoReference: "ATplDJaZjHFPJjzJyz8jLs14b9D15jwXaUbLIbXvTeQC6zLkDxA0acMrB-7rLJOmIeW6T9lej_ipMXEqIBSKveamuwz1OC4FWrE62-xJLMZdHQsQw1TL_WbDmfZw6TxGWf3kEQDUR23e73NZTiJDaIx08tEVT0Vp47Gi76nOgB2IkmFY8Pwk", image: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=ATplDJaZjHFPJjzJyz8jLs14b9D15jwXaUbLIbXvTeQC6zLkDxA0acMrB-7rLJOmIeW6T9lej_ipMXEqIBSKveamuwz1OC4FWrE62-xJLMZdHQsQw1TL_WbDmfZw6TxGWf3kEQDUR23e73NZTiJDaIx08tEVT0Vp47Gi76nOgB2IkmFY8Pwk"),
        SpotInfo(junre: "移動", time: "16:30-17:30", location: "通天閣から道頓堀へ", lat: "", lon: "", other: "", description: "大阪を代表する繁華街へ移動。", placeId: "", placeName: "", address: "", photoReference: "", image: "")]

    
    var body: some View {
        ZStack{
            Color(UIColor(hexString: "FDF5F3")).ignoresSafeArea()
            
            VStack(spacing: 40){
                Button(action: {
                    isShowPhotoLibrary = true
                }){
                    if dbViewModel.selectedImage.count < 1 {
                        if dbViewModel.users[0].image != "" {
                            AsyncImage(url: URL(string: dbViewModel.users[0].image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 200,height: 200)
                            .cornerRadius(10)
                            
                        } else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .foregroundColor(Color(UIColor(hexString: "F8714F")))
                                .frame(width: 200,height: 200)
                                .cornerRadius(10)
                        }
                    } else {
                        if let uiImage = UIImage(data: dbViewModel.selectedImage[0]) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .frame(width: 200,height: 200)
                                .cornerRadius(10)
                        }
                    }
                }
                
                VStack(spacing: 20){
                    Text("画像を変更する").foregroundStyle(Color(UIColor(hexString: "333333"))).font(.custom("ZenMaruGothic-Medium", size: 20))
                    Divider().frame(width: 240, height: 1).background(Color(UIColor(hexString: "333333")))
                }
                
//                Button("save") {
//                                   // kari
//                    dbViewModel.AddPlan(user_id: authViewModel.getUserID(), date: <#String#>, plan: spots)
//                    { error in
//                        if let error = error {
//                            print("Error: \(error.localizedDescription)")
//                        } else {
//                            print("User saved successfully.")
//                            dbViewModel.fetchPlans(user_id: authViewModel.getUserID())
//                        }
//                    }
//                }
                
                Button("Log Out") {
                                   // ログアウトしてログイン画面へ遷移する
                                   authViewModel.signOut()
                               }
                
                ButtonView(action: {
                    
                    if dbViewModel.selectedImage.count > 0 {
                        dbViewModel.AddImage() {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                dbViewModel.EditImage(user_id: authViewModel.getUserID()){ error in
                                    if let error = error {
                                        print("Error: \(error.localizedDescription)")
                                    } else {
                                        print("User saved successfully.")
                                        isCloseModal = false
                                        dbViewModel.selectedImage = []
                                        dbViewModel.user.image = ""
                                        dbViewModel.fetchUsers(user_id: authViewModel.getUserID())
                                    }
                                }
                            }
                        }
                    }
                    
                }, backColor: "FDF5F3", textColor: "333333", text: "変更する")
            }
        }.sheet(isPresented: $isShowPhotoLibrary, content: {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                .onAppear {
                    if image != nil {
                        print(image)
                    }
                }
        })
        .onDisappear(perform: {
            dbViewModel.selectedImage = []
        })
    }
}

//#Preview {
//    EditImageView()
//}
