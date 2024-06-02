//
//  DetailScreen.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 15/2/21.
//

import SwiftUI



let samplefoodImage: [String] = ["https://images.unsplash.com/photo-1707733005801-13548a5f36ea?q=80&w=2486&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://images.unsplash.com/photo-1476055439777-977cdf3a5699?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://images.unsplash.com/photo-1709755568003-d85948a9de8b?q=80&w=2370&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
]


struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var envData: EnvironmentData
    
    let plan: Plan
    
    var spotInfo: [SpotInfo]
    
    init(plan: Plan) {
        self.plan = plan
        self.spotInfo = plan.plan
    }
    
//    (spotInfo[0].image.isEmpty ? (spotInfo[1].image.isEmpty ? sampleImage[0] : spotInfo[1].image) : spotInfo[0].image)
    
    var body: some View {
        ZStack{
            Color(UIColor(hexString: "FDF5F3"))
                .ignoresSafeArea()
            ScrollView{
                if spotInfo.count != 0 {
                    AsyncImage(url: URL(string: (spotInfo[0].image.isEmpty ? (spotInfo[1].image.isEmpty ? sampleImage[0] : spotInfo[1].image) : spotInfo[0].image))) { image in ///メイン画像
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
                        Text(plan.date).font(.custom("ZenMaruGothic-Medium", size: 32))
                        Spacer()
                    }
//                    HStack{ ///　タグ４つ
//                        OptionTagView(option: viewModel.option.withWho)
//                        OptionTagView(option: viewModel.option.season)
//                        OptionTagView(option: viewModel.option.detail1)
//                        OptionTagView(option: viewModel.option.foodType)
//                        Spacer()
//                    }
                    OperateButton() /// ボタン３つ
                }.padding().padding(.horizontal)
                
                VStack(spacing: 30){ ///旅程リスト
                    ForEach(spotInfo, id: \.time) { info in
                        
                        if info.junre.contains("移動") {
                            TransportView(spot: info).onAppear(perform: {
                                print("info: \(info)")
                            })
                        } else {
                            SpotView(spot: info, sampleImage: info.junre == "食事" ? samplefoodImage : sampleImage)
                        }
                        
                    }
                    Spacer()
                }.padding()
                
                
                
            }.ignoresSafeArea().navigationBarBackButtonHidden(true)
        }
        .ignoresSafeArea().navigationBarBackButtonHidden(true).toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
        .sheet(isPresented: $envData.isImplementingModal) {
            DevelopingView().presentationDetents([
                .fraction(0.3)
            ])
        }
    }
    
}

struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
