//
//  PageOneView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/02/17.
//

import SwiftUI

struct PageOneView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var inputName: String
    @Binding var inputDestination: String
    
    var body: some View {
            VStack(spacing: 10){
                VStack(spacing: 20){
                    Text("場所と時間を入力してください").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333"))).padding(.horizontal)
                    Spacer()
                    
                    VStack(spacing: 10){
                        HStack{
                            Text("行き先").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                            Spacer()
                        }
                        HStack{
                            Text("場所").font(.custom("ZenMaruGothic-Regular", size: 15.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                                .frame(width: 150, height: 30)
                                .background(Color(UIColor(hexString: "F3ECEA")))
                                .cornerRadius(15)
                            
                            Spacer()
                            
                            TextField("場所を入力", text: $viewModel.option.start)
                                .frame(width: 150, height: 30)
                                .multilineTextAlignment(TextAlignment.center)
                            //                            .padding(5)
                                .font(.custom("ZenMaruGothic-Regular", size: 15.0)).foregroundStyle(Color(UIColor(hexString: "333333"))).background(Color(UIColor(hexString: "F3ECEA")))
                                .cornerRadius(15)
                            
                        }
                    }.padding(.horizontal)
                    Spacer()
                    
                    VStack(spacing: 10){
                        HStack{
                            Text("時間").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                            Spacer()
                        }
                        HStack{
                            Text("現在時刻").font(.custom("ZenMaruGothic-Regular", size: 15.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                                .frame(width: 150, height: 30)
                                .background(Color(UIColor(hexString: "F3ECEA")))
                                .cornerRadius(15)
                            
                            Spacer()
                            
                            TextField("時刻を入力", text: $viewModel.option.time)
                                .frame(width: 150, height: 30)
                                .multilineTextAlignment(TextAlignment.center)
                            //                            .padding(5)
                                .font(.custom("ZenMaruGothic-Regular", size: 15.0)).foregroundStyle(Color(UIColor(hexString: "333333"))).background(Color(UIColor(hexString: "F3ECEA")))
                                .cornerRadius(15)
                            
                        }
                    }.padding(.horizontal)

                    Spacer()
                }.padding(.horizontal)
            }
            
        
    }
}


struct PageOneView_Previews: PreviewProvider {
    static var previews: some View {
//        OnBoarding()
        PageOneView(inputName: .constant("京都旅行"), inputDestination:.constant("清水寺"))
    }
}
