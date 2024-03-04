

import SwiftUI

@main
struct ChatGPTAPISampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
