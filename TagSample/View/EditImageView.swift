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
                
                Button("Log Out") {
                                   // ログアウトしてログイン画面へ遷移する
                                   authViewModel.signOut()
                               }
                
                ButtonView(action: {
                    
                    if dbViewModel.selectedImage.count < 0 {
                        dbViewModel.AddImage() {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                dbViewModel.EditImage(user_id: authViewModel.getUserID()){ error in
                                    if let error = error {
                                        print("Error: \(error.localizedDescription)")
                                    } else {
                                        print("User saved successfully.")
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

#Preview {
    EditImageView()
}
