//
//  EnvironmentData.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/03/08.
//

import Foundation
import SwiftUI

class EnvironmentData: ObservableObject {
    @Published var isNavigationActive: Binding<Bool> = Binding<Bool>.constant(false)
    
    @Published var isImplementingModal: Bool = false
}
