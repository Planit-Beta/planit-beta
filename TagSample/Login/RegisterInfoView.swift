//
//  RegisterInfoView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/28.
//

import SwiftUI

struct RegisterInfoView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var dbViewModel: DBViewModel
    
    @State var isMoveToHome: Bool = false
    
    @State var inputUserName: String = ""
    @State var inputGender: String = ""
    @State var inputAge: String = ""
    
    var body: some View {
        ZStack{
            Color(UIColor(hexString: "FDF5F3")).ignoresSafeArea()
            
            VStack(spacing: 80){
                VStack(spacing: 15){
                    VStack{
                        Text("メールアドレスを認証しました!").foregroundStyle(Color(UIColor(hexString: "333333"))).font(.custom("ZenMaruGothic-Regular", size: 14))
                        Text("少しだけあなたのことを教えてください").foregroundStyle(Color(UIColor(hexString: "333333"))).font(.custom("ZenMaruGothic-Regular", size: 14))
                    }
                    Divider().frame(width: 240, height: 1).background(Color(UIColor(hexString: "333333")))
                }
                
                VStack(spacing: 20){
                    VStack(alignment: .leading, spacing: 10){
                        Text("ユーザー名").foregroundStyle(.black).font(.custom("ZenMaruGothic-Regular", size: 14))
                        TextField("", text: $dbViewModel.user.name)
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
                        Picker("性別を選択", selection: $dbViewModel.user.gender) {
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
                        TextField("", value: $dbViewModel.user.age, format: .number)
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
                
                ButtonView(action: {
                    
                    dbViewModel.user.id = authViewModel.getUserID()
                    
                    if dbViewModel.user.name.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                        dbViewModel.saveUser(){ error in
                            if let error = error {
                                print("Error: \(error.localizedDescription)")
                            } else {
                                print("User saved successfully.")
                                dbViewModel.fetchUsers(user_id: authViewModel.getUserID())
                                
                                authViewModel.isMoveToRegisterInfo = false
                                authViewModel.isCorrectRegisterInfo = true
                                authViewModel.isAuthenticated = true
                            }
                        }
                    }
                    
                }, backColor: "FDF5F3", textColor: "333333", text: "登録する")
            }
            
//            NavigationLink(
//                destination: HomeView(),
//                isActive: $isMoveToHome,
//                label: { EmptyView() }
//            ).hidden()
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}



#Preview {
    RegisterInfoView()
}
