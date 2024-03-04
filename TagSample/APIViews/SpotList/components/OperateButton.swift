//
//  OperateButton.swift
//  ChatGPTAPISample
//
//  Created by 濱野遥斗 on 2024/03/04.
//

import SwiftUI

struct OperateButton: View {
    var body: some View {
        VStack{
            HStack(spacing: 17){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(decorative: "DeleteBtn")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .shadow(color: .black.opacity(0.25), radius: 3, x: 1, y: 1)
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(decorative: "EditBtn")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .shadow(color: .black.opacity(0.25), radius: 3, x: 1, y: 1)
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(decorative: "ShareBtn")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .shadow(color: .black.opacity(0.25), radius: 3, x: 1, y: 1)
                })
            }
        }
    }
}

#Preview {
    OperateButton()
}
