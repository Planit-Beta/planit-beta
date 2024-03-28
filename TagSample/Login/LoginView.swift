//
//  LoginView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/27.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var inputEmail: String = ""
    @State var inputPassword: String = ""
    var body: some View {
        ZStack{
            Color(UIColor(hexString: "FDF5F3")).ignoresSafeArea()
            
            VStack(spacing: 80){
                VStack(spacing: 20){
                    Text("ログイン").foregroundStyle(Color(UIColor(hexString: "333333"))).font(.custom("ZenMaruGothic-Medium", size: 20))
                    Divider().frame(width: 240, height: 1).background(Color(UIColor(hexString: "333333")))
                }
                
                VStack(spacing: 20){
                    VStack(alignment: .leading, spacing: 10){
                        Text("メールアドレス").foregroundStyle(.black).font(.custom("ZenMaruGothic-Regular", size: 14))
                        TextField("", text: $inputEmail)
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
                        Text("パスワード").foregroundStyle(.black).font(.custom("ZenMaruGothic-Regular", size: 14))
                        TextField("", text: $inputPassword)
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
                
                ButtonView(action: {}, backColor: "F8714F", textColor: "FFFFFF", text: "ログインする")
            }
        }
        .customBackButton()///戻るボタン
    }
}

#Preview {
    LoginView()
}
