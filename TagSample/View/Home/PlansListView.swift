//
//  HomeScreen.swift
//  Furniture_app
//
//  Created by Abu Anwar MD Abdullah on 14/2/21.
//

import SwiftUI

struct PlansListView: View {
    @State private var selectedIndex: Int = 1
    
    var plans: [Plan]
    
    var body: some View {
        
        ScrollView (.horizontal, showsIndicators: false) {
            HStack (spacing: 0) {
                ForEach(plans.indices) { i in
                    NavigationLink(
                        destination: DetailScreen(plan: plans[i]),
                        label: {
                            ProductCardView(spots: plans[i].plan, size: 250)
                        })
                    .navigationBarHidden(true)
                    .foregroundColor(.black)
                    .padding(.leading, i == 0 ? 15 : 0)
                }
                .padding(.leading)
            }
        }
        .padding(.bottom)
    }
}

