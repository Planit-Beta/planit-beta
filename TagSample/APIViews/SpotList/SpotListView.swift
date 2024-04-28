//
//  SpotListView.swift
//  ChatGPTAPISample
//
//  Created by 濱野遥斗 on 2024/03/04.
//

import SwiftUI

struct SpotListView: View {
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var envData: EnvironmentData
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var dbViewModel: DBViewModel
    
    @State var nowDate = Date()
    @State var dateText = ""
    private let dateFormatter = DateFormatter()
    
    init() {
        dateFormatter.dateFormat = "YYYY.MM.dd"
        dateFormatter.locale = Locale(identifier: "ja_jp")
    }
    
    let sampleImage: [String] = ["https://images.unsplash.com/photo-1493780474015-ba834fd0ce2f?q=80&w=2642&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://images.unsplash.com/photo-1505069446780-4ef442b5207f?q=80&w=2253&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://plus.unsplash.com/premium_photo-1661371927364-e3aec9079c66?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://images.unsplash.com/photo-1522623349500-de37a56ea2a5?q=80&w=2674&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ]
    
    let samplefoodImage: [String] = ["https://images.unsplash.com/photo-1707733005801-13548a5f36ea?q=80&w=2486&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://images.unsplash.com/photo-1476055439777-977cdf3a5699?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://images.unsplash.com/photo-1709755568003-d85948a9de8b?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ]

    var body: some View {
        ZStack{
            Color(UIColor(hexString: "FDF5F3"))
                .ignoresSafeArea()
            ScrollView{
                if viewModel.SpotInfos.count != 0 {
                    AsyncImage(url: URL(string: (viewModel.SpotInfos[0].image == "" && viewModel.SpotInfos[1].image == "") ? sampleImage[0] : (viewModel.SpotInfos[0].image == "") ? viewModel.SpotInfos[1].image : viewModel.SpotInfos[0].image)) { image in ///メイン画像
                        image.resizable().scaledToFill().frame(width: UIScreen.main.bounds.width, height: 300)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .clipShape(
                        .rect(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 40,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 0
                        )
                    )
                }
                
                VStack(spacing: 30){
                    HStack{ ///日付
                        Text(dateText).font(.custom("ZenMaruGothic-Medium", size: 32))
                        Spacer()
                    }
                    HStack{ ///　タグ４つ
                        OptionTagView(option: viewModel.option.withWho)
                        OptionTagView(option: viewModel.option.season)
                        OptionTagView(option: viewModel.option.detail1)
                        OptionTagView(option: viewModel.option.foodType)
                        Spacer()
                    }
                    OperateButton() /// ボタン３つ
                }.padding().padding(.horizontal)
                
                VStack(spacing: 30){ ///旅程リスト
                    ForEach(viewModel.SpotInfos, id: \.time) { info in
                        
                        if info.junre.contains("移動") {
                            TransportView(spot: info).onAppear(perform: {
                                print("info: \(info)")
                            })
                        } else {
                            SpotView(spot: info, sampleImage: info.junre == "食事" ? samplefoodImage : sampleImage)
                        }
                        
                    }
                }.padding()
                
                HStack{ ///確定ボタン
                    Spacer()
                    
                    SaveButtonView(action: {
                        dbViewModel.AddPlan(user_id: authViewModel.getUserID(), plan: viewModel.SpotInfos) { error in
                            if let error = error {
                                print("Error: \(error.localizedDescription)")
                            } else {
                                print("User saved successfully.")
                                dbViewModel.plans = []
                                dbViewModel.fetchUsers(user_id: authViewModel.getUserID())
                                envData.isNavigationActive.wrappedValue = false
                            }
                        }
                    })
                    
                    Spacer()
                }.padding(.top, 50).padding(.bottom, 70)
                
                
            }.ignoresSafeArea().navigationBarBackButtonHidden(true)
        }.onAppear {
            self.nowDate = Date()
            dateText = (dateFormatter.string(from: nowDate))
        }
        .onDisappear(perform: {
            viewModel.reset()
        })
    }
}

#Preview {
    SpotListView().environmentObject(ViewModel())
}
