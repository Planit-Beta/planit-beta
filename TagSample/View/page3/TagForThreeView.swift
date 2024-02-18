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


struct TagForThreeView: View {
    @State private var tags: [Tag] = sampleTags.map { Tag(name: $0) }

    var body: some View {
        NavigationView {
            VStack {
                CustomTagView(alignment: .leading, spacing: 10) {
                    ForEach(tags.indices, id: \.self) { index in
                        Toggle(tags[index].name, isOn: $tags[index].isSelected)
                            .bold()
                            .toggleStyle(.button)
                            .buttonStyle(.bordered)
                            .clipShape(Capsule())
                            .foregroundColor(tags[index].isSelected ? .blue : .primary)
                            .tint(tags[index].isSelected ? .blue : .black)
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
