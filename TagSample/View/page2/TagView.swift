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

struct TagView: View {
    @State private var tags: [Tag] = interestTags.map { Tag(name: $0) }

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

struct CustomTagView: Layout {
    var alignment: Alignment = .leading
    var spacing: CGFloat = 10
    init(alignment: Alignment, spacing: CGFloat) {
        self.alignment = alignment
        self.spacing = spacing
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return .init(width: proposal.width ?? 0, height: proposal.height ?? 0)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var origin = bounds.origin
        let maxWidth = bounds.width
        
        var row: ([LayoutSubviews.Element], Double) = ([], 0.0)
        var rows: [([LayoutSubviews.Element], Double)] = []
        
        for view in subviews {
            let viewSize = view.sizeThatFits(proposal)
            if (origin.x + viewSize.width + spacing) > maxWidth {
                row.1 = (bounds.maxX - origin.x + bounds.minX + spacing)
                rows.append(row)
                row.0.removeAll()
                origin.x = bounds.origin.x
                row.0.append(view)
                origin.x += (viewSize.width + spacing)
            } else {
                row.0.append(view)
                origin.x += (viewSize.width + spacing)
            }
        }
        
        if !row.0.isEmpty {
            row.1 = (bounds.maxX - origin.x + bounds.minX + spacing)
            rows.append(row)
        }
        origin = bounds.origin
        
        for row in rows {
            origin.x = (alignment == .leading ? bounds.minX : (alignment == .trailing ? row.1 : row.1 / 2))
            for view in row.0 {
                let viewSize = view.sizeThatFits (proposal)
                view.place (at: origin, proposal: proposal)
                origin.x += (viewSize.width + spacing)
            }
            let maxHeight = row.0.compactMap{ view -> CGFloat? in
                return view.sizeThatFits(proposal).height
            }.max() ?? 0
            origin.y += (maxHeight + spacing)
        }
    }
}


struct TagView_Previews: PreviewProvider {
    static var previews: some View {
//        PageTwoView(inputName: .constant("京都旅行"), inputDestination:.constant("清水寺"))
        TagView()
    }
}
