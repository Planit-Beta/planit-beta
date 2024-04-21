//
//  HomeView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/02/21.
//


import SwiftUI

struct HomeView: View {
    @State var isActive: Bool = false
    @EnvironmentObject var envData: EnvironmentData
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var dbViewModel: DBViewModel
    
    @State var isShowProfile: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(UIColor(hexString: "FDF5F3"))
                    .ignoresSafeArea()
                
                VStack(){
                    
                    VStack{
                        HStack(){
                            Text(dbViewModel.users.count == 0 ? "" :  dbViewModel.users[0].name).font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                            Spacer()
                        }
                        HStack{
                            Text(authViewModel.getEmail())
                                .font(.custom("ZenMaruGothic-Regular", size: 11.0)).foregroundStyle(Color(UIColor(hexString: "333333")).opacity(0.5))
                            Spacer()
                        }
                    }.padding(.horizontal)
                        .overlay(
                            HStack{
                                Spacer()
                                Button(action:{
                                    isShowProfile = true
                                }){
                                    Image(decorative: "sample_1")
                                        .resizable()
                                        .scaledToFit()
                                        .clipShape(Circle())
                                }
                            }
                        ).padding(.horizontal)
                    
                    Spacer()
                    
                    Button {
                        isActive = true
                        envData.isNavigationActive = $isActive
                    } label: {
                        Text("新しく旅程を生成する")
                            .font(.custom("ZenMaruGothic-Medium", size: 24.0))
                            .foregroundStyle(Color(UIColor(hexString: "FFFFFF")))
                            .frame(width: 320, height: 80)
                            .background(Color(UIColor(hexString: "F8714F")))
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    }
                    
                    NavigationLink(destination: OnBoarding(), isActive: $isActive) {
                        EmptyView()
                    }
                    
                    Spacer()
                    
                    VStack{
                        HStack(){
                            Text("自分の旅程").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                            Spacer()
                        }.padding(.horizontal).padding(.horizontal)
                        HomeScreen()
                    }
                    Spacer()
                }
            }.sheet(isPresented: $isShowProfile) {
                EditImageView()
//                Button("Log Out") {
//                    // ログアウトしてログイン画面へ遷移する
//                    authViewModel.signOut()
//                }
            }
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                dbViewModel.fetchUsers(user_id: authViewModel.getUserID())
            })
    }
}


//struct HomeView_Preview: PreviewProvider {
//    static var previews: some View {
////        OnBoarding()
//        HomeView(inputName: .constant("京都旅行"), inputDestination:.constant("清水寺"))
//    }
//}

