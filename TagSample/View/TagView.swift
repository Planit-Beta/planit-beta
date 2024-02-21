//
//  TagView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/02/18.
//

import SwiftUI

var interestTags: [String] = ["Memes", "News", "Music", "Crypto",
"Comedy", "Technology", "Animals", "DIY", "Life Hacks",
"Automobiles", "Fashion", "Food", "Outdoors", "Gaming",
"Travel", "Parenting", "Gardening", "Skateboarding",
 "Witchcraft", "Love", "Relationships"]

struct Tag: Identifiable {
    var id = UUID().uuidString
    var name: String
    var isSelected: Bool = false
}
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
struct ToggleTagView: View {
    @Binding var tags: [Tag]
    var chunkedTags: [[Tag]] = [[]]
    init(tags: Binding<[Tag]>) {
            _tags = tags
            self.chunkedTags = tags.wrappedValue.chunked(into: 4)
        }
    
    var body: some View {
            VStack(spacing: 10){
                ForEach(chunkedTags.indices, id: \.self) { i in
                    HStack {
                        ForEach(chunkedTags[i].indices, id: \.self) { j in
                            let index = i * 4 + j
                            Toggle(isOn: $tags[index].isSelected, label: {
                                Text(tags[index].name).font(.custom("ZenMaruGothic-Regular", size: 14.0))
                                    .foregroundStyle(Color(UIColor(hexString: "333333")))
                            })
                            .background(Color(UIColor(hexString: "F3ECEA")))
                            .toggleStyle(.button)
//                            .buttonStyle(.bordered)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .tint(Color(UIColor(hexString: "F8714F")))
                            .onChange(of: tags[index].isSelected) { newValue in
                                if newValue {
                                    for i in tags.indices {
                                        if i != index {
                                            tags[i].isSelected = false
                                        }
                                    }
                                    print("Tag number \(tags[index].name) selected.")
                                }
                            }
                            if j != chunkedTags[i].count - 1 {
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
}

//struct TagView_Previews: PreviewProvider {
//    static var previews: some View {
////        PageTwoView(inputName: .constant("京都旅行"), inputDestination:.constant("清水寺"))
//        TagView()
//    }
//}
