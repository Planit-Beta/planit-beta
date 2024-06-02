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


struct ToggleTagView: View {
    @ObservedObject private var chatGPTViewModel = ChatGPTViewModel.shared
    @Binding var tags: [Tag]
    @Binding var option: String
//    var index: Int
    var chunkedTags: [[Tag]]
    
    init(tags: Binding<[Tag]>, option: Binding<String>) {
        _tags = tags
        _option = option
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
                                    .foregroundStyle(Color(UIColor(hexString: tags[index].isSelected ? "FFFFFF" : "333333")))
                            })
                            .background(Color(UIColor(hexString: tags[index].isSelected ?  "F8714F" : "FFFFFF")))
                            .toggleStyle(.button)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .tint(Color(UIColor(hexString: "F8714F")))
                            .onChange(of: tags[index].isSelected) { newValue in
                                if newValue {
                                    for i in tags.indices {
                                        if i != index {
                                            tags[i].isSelected = false
                                        }
                                    }
                                    option = tags[index].name
                                    chatGPTViewModel.selectedOptions.append(tags[index].name)
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



struct selectedTagView: View {
    @ObservedObject private var chatGPTViewModel = ChatGPTViewModel.shared
    
    @State var isOn: Bool = false
    
    var body: some View {
        VStack(spacing: 10){
            ForEach(0..<chatGPTViewModel.selectedOptions.count, id: \.self) { index in
                if index % 4 == 0 {
                    HStack {
                        ForEach(index..<min(index + 4,  chatGPTViewModel.selectedOptions.count), id: \.self) { tagIndex in
                            Toggle(isOn: $isOn, label: {
                                Text(chatGPTViewModel.selectedOptions[tagIndex])
                                    .font(.custom("ZenMaruGothic-Regular", size: 14.0))
                                    .foregroundStyle(Color(UIColor(hexString: "333333")))
                                })
                                .background(Color(UIColor(hexString: "FFFFFF")))
                                .toggleStyle(.button)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .disabled(true)
                            
                                if tagIndex != chatGPTViewModel.selectedOptions.count - 1 {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        selectedTagView()
    }
}
