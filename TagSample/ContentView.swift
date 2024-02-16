//
//  ContentView.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/02/16.
//

import SwiftUI
import SwiftUI

struct ContentView: View {
    
    @State var offset: CGFloat = .zero
    
    var body: some View {
        
        
        OnBoarding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
}
