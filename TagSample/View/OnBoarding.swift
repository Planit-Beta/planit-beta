import SwiftUI

struct OnBoarding: View {
    
    @State var offset: CGFloat = .zero
    @State var isShowBackBtn: Bool = false
    @State var isShowNextBtn: Bool = true
    @State private var progressVal = 0.0
    
    var body: some View {
        
        OffsetPageTabView(offset: $offset) { 
            
            HStack {
                VStack(spacing: 15) {
                    Text("hhhhhh")
                    

                    
                }
                .frame(width: getScreenBounds().width)
                .frame(maxHeight: .infinity)
                
                ForEach(boardingScreens) { screen in
                    
                    VStack(spacing: 15) {
                        Text("gwoheg")
                        
//                        Image(screen.image)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
//                            .offset(y: -150)
//                        
//                        VStack(alignment: .leading, spacing: 15) {
//                            
//                            Text(screen.title)
//                                .font(.largeTitle.bold())
//                                .foregroundColor(Color(UIColor(hexString: "333333")))
//                            
//                            Text(screen.description)
//                                .fontWeight(.semibold)
//                                .foregroundColor(Color(UIColor(hexString: "333333")))
//                            
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding()
//                        .offset(y: -70)
                        
                    }
                    .frame(width: getScreenBounds().width)
                    .frame(maxHeight: .infinity)
                }
                
            }
            
        }.background(
            
            Color(Color(UIColor(hexString: "FFFFFF")))
                           .animation(.easeInOut, value: getIndex())
        
        )
        .ignoresSafeArea(.container, edges: .all)
        .overlay(
            VStack{
            Text("新しく旅程を作成する")
                ProgressView(value: progressVal, total: 100)
            }.padding(),alignment: .top
        )
        .overlay(
            
            VStack {
                HStack(spacing: 50) {
                    Spacer()
                    Button {
                        backToPriveousPage()
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
            .padding(),alignment: .bottom
            
        )
        
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
        let index = getIndex() + 1
        if(index == 0){
            isShowBackBtn = false
            isShowNextBtn = true
        } else if (index == 2) {
            isShowNextBtn = false
            isShowBackBtn = true
        } else {
            isShowBackBtn = true
            isShowNextBtn = true
        }
        if getIndex() + 1 < boardingScreens.count {
            offset = offset + getScreenBounds().width
        }
    }
    
    func backToPriveousPage() {
        if(getIndex() - 1 >= 0){
            let index = getIndex() - 1
            if(index == 0){
                isShowBackBtn = false
                isShowNextBtn = true
            } else if (index == 2) {
                isShowNextBtn = false
                isShowBackBtn = true
            } else {
                isShowBackBtn = true
                isShowNextBtn = true
            }
            print(index)
            offset = offset - getScreenBounds().width
        }
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
