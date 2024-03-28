//
//  CustomBackButton.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/28.
//

import SwiftUI

struct CustomBackButton: ViewModifier {
    
    @Environment(\.dismiss) var dismiss

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar { ///戻るボタン
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(
                        action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "arrow.backward")
                                .frame(width: 40, height: 40)
                                .background(Color(UIColor(hexString: "FDF5F3")))
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        }
                    ).tint(Color(UIColor(hexString: "333333")))
                }
            }
    }
}


//#Preview {
//    CustomBackButton()
//}
