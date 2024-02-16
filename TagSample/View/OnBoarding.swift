import SwiftUI

struct OnBoarding: View {
    
    @State var offset: CGFloat = .zero
    @State var isShowBackBtn: Bool = false
    @State var isShowNextBtn: Bool = true
    @State private var progressVal = 0.0
    
    
    @State var selection = 1
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){ ///画面上部のバー
                Text("新しく旅程を作成する").padding().foregroundStyle(Color(UIColor(hexString: "333333")))
                ProgressView(value: progressVal, total: 100)
                    .animation(.easeInOut, value: progressVal)//バーのアニメーション
                    .tint(Color(UIColor(hexString: "333333")))//バーの色
                    .scaleEffect(x: 1, y: 0.5)//バーの高さ
            }
            
            VStack{
                TabView(selection: $selection) { ///画面中央のメインView
                    PageOneView()   // Viewファイル①
                        .tabItem {
                            Label("Page1", systemImage: "1.circle")
                        }
                        .tag(1)
                    
                    PageTwoView()   // Viewファイル②
                        .tabItem {
                            Label("Page2", systemImage: "2.circle")
                        }
                        .tag(2)
                    
                    PageThreeView()  // Viewファイル③
                        .tabItem {
                            Label("Page3", systemImage: "3.circle")
                        }
                        .tag(3)
                    
                }.disabled(true)// スワイプアクションを無効化
                    .tabViewStyle(.page(indexDisplayMode: .never))// ページスタイル（インジケータ非表示）
                    .animation(.easeInOut, value: selection)// 切り替え時のアニメーション
                    .background(
                        Color(Color(UIColor(hexString: "FFFFFF")))
                    )
                    .ignoresSafeArea(.container, edges: .all)
                
                VStack {///画面下部の矢印ボタン
                    HStack(spacing: 50) {
                        Spacer()
                        Button {
                            backToPriveousPage()
                            progressVal -= 50
                            selection -= 1
                        } label: {
                            Image(systemName: "arrowtriangle.backward.fill")
                                .foregroundColor(Color(UIColor(hexString: "9C9C9C")))
                                .font(.system(size: 50))
                            
                        }
                        .disabled(!isShowBackBtn)
                        .opacity(isShowBackBtn ? 1 : 0)
                        .animation(.easeInOut, value: getIndex())
                        
                        HStack(spacing: 20) {
                            ForEach(boardingScreens.indices, id: \.self) { index in
                                
                                Circle()
                                    .fill(Color(UIColor(hexString: "9C9C9C")))
                                    .opacity(index == getIndex() ? 1 : 0.4)
                                    .frame(width: 12, height: 12)
                                    .scaleEffect(index == getIndex() ? 1.2 : 1)
                                    .animation(.easeInOut, value: getIndex())
                            }
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                        Button {
                            goToNextPage()
                            progressVal += 50
                            selection += 1
                        } label: {
                            Image(systemName: "arrowtriangle.forward.fill")
                                .foregroundColor(Color(UIColor(hexString: "9C9C9C")))
                                .font(.system(size: 50))
                            
                        }
                        .disabled(!isShowNextBtn)
                        .opacity(isShowNextBtn ? 1 : 0)
                        .animation(.easeInOut, value: getIndex())
                        Spacer()
                    }
                    .padding(.top, 25)
                }
                
            }
                
                
                
            }
    }
    
    func getRotation() -> Double {
        let process = offset / (getScreenBounds().width * 4)
        
        let rotation = Double(process) * 360
        
        return rotation
    }
    
    func getIndex() -> Int {
        
        let process = offset / getScreenBounds().width
        
        return Int(process)
        
    }
    
    func goToNextPage() {
        let index = selection + 1
        if(index == 1){
            isShowBackBtn = false
            isShowNextBtn = true
        } else if (index == 3) {
            isShowNextBtn = false
            isShowBackBtn = true
        } else {
            isShowBackBtn = true
            isShowNextBtn = true
        }
    }
    
    func backToPriveousPage() {
        let index = selection - 1
        if(index == 1){
            isShowBackBtn = false
            isShowNextBtn = true
        } else if (index == 3) {
            isShowNextBtn = false
            isShowBackBtn = true
        } else {
            isShowBackBtn = true
            isShowNextBtn = true
        }
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}


struct PageOneView: View {
    var body: some View {

        VStack{
//            Color.black
            Text("行き先とそこに行きたい時間帯を\n入力してください").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
            Spacer()
            VStack(spacing: 10){
                Text("旅行名").font(.custom("ZenMaruGothic-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                
            }
            Spacer()
        }.padding()

    } // body
} // V

struct PageTwoView: View {
    var body: some View {

        ZStack {
            Text("Page2")
        } // ZStack

    } // body
} // V


struct PageThreeView: View {
    var body: some View {

        ZStack {  // 背景色
            Text("Page3")
        } // ZStack

    } // body
} // V

