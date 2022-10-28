import SwiftUI

@main
struct MemoryGameApp: App {
    var body: some Scene {
        WindowGroup {
           EmojiMemoryGameView(viewModel: EmojiMemoryGameViewModel())
        }
    }
}
