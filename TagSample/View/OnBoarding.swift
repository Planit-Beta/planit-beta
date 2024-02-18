import SwiftUI

struct OnBoarding: View {
    
    @State var offset: CGFloat = .zero
    @State var isShowBackBtn: Bool = false
    @State var isShowNextBtn: Bool = true
    @State private var progressVal = 0.0
    
    @State var inputName: String = ""//旅行名
    @State var inputDestination: String = ""//行き先
    
    @State var selection = 1
    
    var body: some View {
        NavigationView{
            VStack{
                VStack(alignment: .leading){ ///画面上部のバー
                    Text("新しく旅程を作成する").padding().font(.custom("ZenMaruGothic-Medium", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                    ProgressView(value: min(max(progressVal, 0.0), 100), total: 100)
                        .animation(.easeInOut, value: progressVal)//バーのアニメーション
                        .tint(Color(UIColor(hexString: "333333")))//バーの色
                        .scaleEffect(x: 1, y: 0.5)//バーの高さ
                }
                
                VStack{
                    if selection == 1 {
                        PageOneView(inputName: $inputName, inputDestination: $inputDestination)
                        //                        .transition(.move(edge: .leading))
                    } else if selection == 2 {
                        PageTwoView()
                        //                        .transition(.move(edge: .leading))
                    } else {
                        PageThreeView()
                        //                        .transition(.move(edge: .trailing))
                    }
                }.padding().animation(.easeInOut, value: selection)
                
                //            VStack{
                //                TabView(selection: $selection) {///画面中央のメインView
                //                    
                //                    PageOneView()   // Viewファイル①
                //                            .tabItem {
                //                                Label("Page1", systemImage: "1.circle")
                //                            }
                //                            .tag(1)
                //                    
                //                    PageTwoView()   // Viewファイル②
                //                        .tabItem {
                //                            Label("Page2", systemImage: "2.circle")
                //                        }
                //                        .tag(2)
                //                    
                //                    PageThreeView()  // Viewファイル③
                //                        .tabItem {
                //                            Label("Page3", systemImage: "3.circle")
                //                        }
                //                        .tag(3)
                //                    
                //                }.disabled(true)// スワイプアクションを無効化
                //                    .tabViewStyle(.page(indexDisplayMode: .never))// ページスタイル（インジケータ非表示）
                //                    .animation(.easeInOut, value: selection)// 切り替え時のアニメーション
                //                    .background(
                //                        Color(Color(UIColor(hexString: "FFFFFF")))
                //                    )
                //                    .ignoresSafeArea(.container, edges: .all)
                //            }.padding()
                
                Spacer()
                
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
                            ForEach(0..<3, id: \.self) { index in
                                
                                Circle()
                                    .fill(Color(UIColor(hexString: "9C9C9C")))
                                    .opacity(index == selection-1 ? 1 : 0.4)
                                    .frame(width: 12, height: 12)
                                    .scaleEffect(index == selection-1 ? 1.2 : 1)
                                    .animation(.easeInOut, value: selection)
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
                }
            }
        }
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
