//
//  EditProfileView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/04/22.
//

import SwiftUI

struct EditProfileView: View {
    @ObservedObject private var firebaseAuthViewModel = FirebaseAuthViewModel.shared
    @ObservedObject private var firestoreViewModel = FirestoreViewModel.shared
    
    
    @State var isMoveToHome: Bool = false
    
    @State var value: Decimal.FormatStyle.FormatInput = 0.0
    
    @Binding var isCloseModal: Bool
    
    var body: some View {
        ZStack{
            Color(UIColor(hexString: "FDF5F3")).ignoresSafeArea()
            
            VStack(spacing: 80){
                VStack(spacing: 20){
                    Text("プロフィールを変更する").foregroundStyle(Color(UIColor(hexString: "333333"))).font(.custom("ZenMaruGothic-Medium", size: 20))
                    Divider().frame(width: 240, height: 1).background(Color(UIColor(hexString: "333333")))
                }
                
                VStack(spacing: 20){
                    VStack(alignment: .leading, spacing: 10){
                        Text("ユーザー名").foregroundStyle(.black).font(.custom("ZenMaruGothic-Regular", size: 14))
                        TextField("", text: $firestoreViewModel.inputUserName)
                            .autocapitalization(.none)
                            .frame(width: 240, height: 30)
                            .multilineTextAlignment(TextAlignment.center)
                            .font(.custom("ZenMaruGothic-Regular", size: 15.0)).foregroundStyle(Color(UIColor(hexString: "333333"))).background(.clear)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0))
                                    .stroke(Color(UIColor(hexString: "333333")), lineWidth: 0.5)
                            )
                    }
                    VStack(alignment: .leading, spacing: 10){
                        Text("性別").foregroundStyle(.black).font(.custom("ZenMaruGothic-Regular", size: 14))
                        Picker("性別を選択", selection: $firestoreViewModel.inputGender) {
                            Text("男").tag("男")
                            Text("女").tag("女")
                            Text("その他").tag("その他")
                        }
                        .tint(Color(UIColor(hexString: "333333")).opacity(0.75))
                        .frame(width: 240, height: 30)
                        .multilineTextAlignment(TextAlignment.center)
                        .font(.custom("ZenMaruGothic-Regular", size: 15.0)).foregroundStyle(Color(UIColor(hexString: "333333"))).background(.clear)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0))
                                .stroke(Color(UIColor(hexString: "333333")), lineWidth: 0.5)
                        )
                    }
                    VStack(alignment: .leading, spacing: 10){
                        Text("年齢").foregroundStyle(.black).font(.custom("ZenMaruGothic-Regular", size: 14))
                        TextField("", value: $firestoreViewModel.inputAge, format: .number)
                            .autocapitalization(.none)
                            .frame(width: 240, height: 30)
                            .multilineTextAlignment(TextAlignment.center)
                            .font(.custom("ZenMaruGothic-Regular", size: 15.0)).foregroundStyle(Color(UIColor(hexString: "333333"))).background(.clear)
                            .cornerRadius(5)
                            .overlay(
                                   RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0))
                                    .stroke(Color(UIColor(hexString: "333333")), lineWidth: 0.5)
                           )
                    }
                }
                
                VStack(spacing: 10){
                    ButtonView(action: {
                        //                    dbViewModel.user.id = authViewModel.getUserID()
                        
                        if firestoreViewModel.inputUserName.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                            firestoreViewModel.EditProfile(user_id: firebaseAuthViewModel.getUserID()){ error in
                                if let error = error {
                                    print("Error: \(error.localizedDescription)")
                                } else {
                                    print("User saved successfully.")
                                    isCloseModal = false
                                    firestoreViewModel.inputUserName = ""
                                    firestoreViewModel.inputAge = 0
                                    firestoreViewModel.inputGender = ""
                                    firestoreViewModel.fetchUsers(user_id: firebaseAuthViewModel.getUserID())
                                }
                            }
                        }
                        
                    }, backColor: "FDF5F3", textColor: "333333", text: "変更する")
                    
                    HStack(spacing: 0){
                        Text("サインアウトは").foregroundStyle(Color(UIColor(hexString: "333333"))).font(.custom("ZenMaruGothic-Regular", size: 14))
                        Button(action: {firebaseAuthViewModel.signOut()}){
                            Text("こちら").foregroundStyle(Color(UIColor(hexString: "F8714F"))).font(.custom("ZenMaruGothic-Medium", size: 14))
                        }
                    }
                }
            }
            
        }.onAppear(perform: {
            firestoreViewModel.inputUserName = firestoreViewModel.users[0].name
            firestoreViewModel.inputGender = firestoreViewModel.users[0].gender
            firestoreViewModel.inputAge = firestoreViewModel.users[0].age
        })
        .onDisappear(perform: {
            firestoreViewModel.inputUserName = ""
            firestoreViewModel.inputAge = 0
            firestoreViewModel.inputGender = ""
        })
    }
}

//#Preview {
//    EditProfileView()
//}
