//
//  DevelopingView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/04/28.
//

import SwiftUI

struct DevelopingView: View {
    var body: some View {
        ZStack{
            Color(UIColor(hexString: "FDF5F3")).ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("実装中...")
                    .foregroundStyle(Color(UIColor(hexString: "333333"))).font(.custom("ZenMaruGothic-Medium", size: 20))
                Spacer()
            }
        }
    }
}

#Preview {
    DevelopingView()
}
