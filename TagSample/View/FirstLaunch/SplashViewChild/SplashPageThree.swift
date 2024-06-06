//
//  SplashPage3.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/27.
//

import SwiftUI

struct SplashPageThreeView: View {
    @ObservedObject private var publicDataViewModel = PublicDataViewModel.shared
    @State var isMoveToLogin: Bool = false
    @State var isMoveToRegister: Bool = false
    
    var body: some View {
        ZStack{
            Color(UIColor(hexString: "FDF5F3")).ignoresSafeArea()
            
            VStack(spacing: 40){
                Image(decorative: "planit_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 230)
                VStack(spacing: 10){
                    Text("あなたもPlanitを使って").foregroundStyle(.black).font(.custom("ZenMaruGothic-Medium", size: 16))
                    Text("最高の休日を").foregroundStyle(.black).font(.custom("ZenMaruGothic-Medium", size: 16))
                }
                
                VStack(spacing: 25){
                    ButtonView(action: {isMoveToLogin = true}, backColor: "FDF5F3", textColor: "333333", text: "ログイン")
                    ButtonView(action: {publicDataViewModel .isImplementingModal = true}, backColor: "FDF5F3", textColor: "333333", text: "Googleでログイン")
                    Divider().frame(width: 240, height: 1).background(Color(UIColor(hexString: "333333")))
                    ButtonView(action: {isMoveToRegister = true}, backColor: "F8714F", textColor: "FFFFFF", text: "新規登録")
                }
            }
            
            NavigationLink(
                destination: LoginView(),
                isActive: $isMoveToLogin,
                label: { EmptyView() }
            ).hidden()
            NavigationLink(
                destination: RegisterView(),
                isActive: $isMoveToRegister,
                label: { EmptyView() }
            ).hidden()
        }.sheet(isPresented: $publicDataViewModel.isImplementingModal) {
            DevelopingView().presentationDetents([
                .fraction(0.3)
            ])
        }
    }
}

#Preview {
    SplashPageThreeView()
}
