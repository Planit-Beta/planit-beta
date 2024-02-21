//
//  TagForThreeView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/02/18.
//

import SwiftUI

var sampleTags: [String] = ["Memes", "News", "Music", "Crypto",
"Comedy", "Technology", "Animals", "DIY", "Life Hacks",
"Automobiles", "Fashion", "Food", "Outdoors", "Gaming",
"Travel", "Parenting", "Gardening", "Skateboarding"]

var sampleTags1:  [String] = ["一人で", "家族で", "友人と", "恋人と"]
var sampleTags2:  [String] = ["まったり観光", "たくさん巡りたい"]
var sampleTags3:  [String] = ["有名どころ", "知る人ぞ知る"]
var sampleTags4:  [String] = ["低予算", "カジュアル", "贅沢"]

struct TagForThreeView: View {
    @State var tags1: [Tag] = sampleTags1.map { Tag(name: $0) }
    @State var tags2: [Tag] = sampleTags2.map { Tag(name: $0) }
    @State var tags3: [Tag] = sampleTags3.map { Tag(name: $0) }
    @State var tags4: [Tag] = sampleTags4.map { Tag(name: $0) }

    var body: some View {
            VStack(spacing: 10){
                ToggleTagView(tags: tags1)
                ToggleTagView(tags: tags2)
                ToggleTagView(tags: tags3)
                ToggleTagView(tags: tags4)
            }
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
struct ToggleTagView: View {
    @State var tags: [Tag]
    var chunkedTags: [[Tag]] = [[]]
    init(tags: [Tag]) {
        self.tags = tags
        self.chunkedTags = tags.chunked(into: 4)
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

struct TagForThreeView_Previews: PreviewProvider {
    static var previews: some View {
        TagForThreeView()
    }
}
