

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State var observation: NSKeyValueObservation?
//    @State private var text = ""
//    @FocusState var focus: Bool
    
    var start: String = "東京"
    var time: Int = 5
    var withWho: String = "友達と"
    var detail1: String = "有名スポット"
    var detail2: String = "インスタ映え"
    var detail3: String = "人気"
    
//    var foodType: String = "和食"

    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    Button {
                        viewModel.askChatGPT(text: "# 作成項目 (\(start)を出発に\(5)時間分の予定を生成します。\(detail1)を\(withWho)過ごし、\(detail2)や\(detail3)スポットにも周りたいです。以下の条件を考慮し、行き先を選び、その行き先と食事を含んだ楽しめる予定を提案してください。予定の中でそこで過ごす時間も書いてください。なお、食事は昼食、夕食それぞれに関して、\(viewModel.foodType)を中心に選んでください。必ず出力形式を守り、レスポンスを返してくださいとして返してください。 ## 旅程の定義 - ジャンル 観光か食事（昼食、夕食）か  - 場所 場所名、食事ならどこ周辺で食べるべきかだけ  - 緯度 場所で出力したところの緯度  - 経度 場所で出力したところの経度  - 時間 何時間過ごすのか")
                    } label: {
                        Text("旅程を生成する")
                            .font(.custom("ZenMaruGothic-Medium", size: 24.0))
                        //                    .foregroundStyle(Color(UIColor(hexString: "FFFFFF")))
                            .foregroundStyle(.white)
                            .frame(width: 320, height: 80)
                        //                    .background(Color(UIColor(hexString: "F8714F")))
                            .background(.orange)
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 2, x: 0, y: 2)
                    }
                    .padding(.vertical)
                }
                NavigationLink(
                    destination: ProgressingView(),
                    isActive: $viewModel.isAsking,
                    label: { EmptyView() }
                ).hidden()
            }
//            .navigationBarHidden(true)
        }.navigationBarHidden(true)
    }
}

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}

#Preview {
    MainView()
}
