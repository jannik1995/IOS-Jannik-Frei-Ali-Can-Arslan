import Foundation
import SwiftUI

class EmojiMemoryGameViewModel: ObservableObject {
    
    init() {
        model = EmojiMemoryGameViewModel.createMemoryGame(EmojiSet: 0, Difficulty: Difficulty.easy )
    }
    
    
    
    @Published private var model: MemoryGame<String>
    
    
    static func createMemoryGame(EmojiSet: Int,Difficulty: Difficulty)->MemoryGame<String> {
        
        let themes = [
            ["😀","😬","😁","😂","😃","😄","😅","😆","😇","😉","😊","🙂","🙃","☺️","😋","😌","😍","😘","😗","😙","😚","😜","😝","😛","🤑","🤓","😎","🤗","😏","😶","😐","😑","😒","🙄","🤔","😳","😞","😟","😠","😡","😔","😕","🙁","☹️","😣","😖","😫","😩","😤","😮","😱","😨","😰","😯","😦","😧","😢","😥","😪","😓","😭","😵","😲","🤐","😷","🤒","🤕","😴"],
            ["🐶","🐱","🐭","🐹","🐰","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐙","🐵","🙈","🙉","🙊","🐒","🐔","🐧","🐦","🐤","🐣","🐥","🐺","🐗","🐴","🦄","🐝","🐛","🐌","🐞","🐜","🕷","🦂","🦀","🐍","🐢","🐠","🐟","🐡","🐬","🐳","🐋","🐊","🐆","🐅","🐃","🐂","🐄","🐪","🐫","🐘","🐐","🐏","🐑","🐎","🐖","🐀","🐁","🐓","🦃","🕊","🐕","🐩","🐈","🐇","🐿","🐉","🐲"]
            ]
        let screenSize = Int(UIScreen.main.bounds.width)
        print(screenSize)
        let playingTheme = themes[EmojiSet].shuffled()[..<(Difficulty.rawValue )]
        
        return  MemoryGame<String>(numberOfPairsOfCards: playingTheme.count, cardContentFactory: { pairIndex in
            return playingTheme[pairIndex]
        })
    }
    
    // MARK: - Access to the Model
    var cards: [MemoryGame<String>.Card]{
        return model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    func newGame(EmojiSet: Int,Difficulty: Difficulty){
       model = EmojiMemoryGameViewModel.createMemoryGame(EmojiSet: EmojiSet, Difficulty: Difficulty)
    }
    
    func cardAmountDisplay(Difficulty: Difficulty, ScreenSize: Int, ElementAmount: Int) -> Int{
        
        return Difficulty.rawValue * ScreenSize % ElementAmount
        
    }
    
    func getScore()->Int{
        return model.scoreCounter
    }
    
    func getHighScore()->Int{
        return model.highScore
    }
    
}
