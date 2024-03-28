//
//  RegisterInfoView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/28.
//

import SwiftUI

struct RegisterInfoView: View {
//    @Environment(\.dismiss) var dismiss
    
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
                        TextField("", text: $inputUserName)
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
                        TextField("", text: $inputGender)
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
                        TextField("", text: $inputAge)
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
                
                ButtonView(action: {isMoveToHome = true}, backColor: "FDF5F3", textColor: "333333", text: "登録する")
            }
            NavigationLink(
                destination: HomeView(),
                isActive: $isMoveToHome,
                label: { EmptyView() }
            ).hidden()
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}



#Preview {
    RegisterInfoView()
}
