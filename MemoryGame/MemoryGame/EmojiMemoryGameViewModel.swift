import Foundation
import SwiftUI

class EmojiMemoryGameViewModel: ObservableObject {
    
    init() {
        model = EmojiMemoryGameViewModel.createMemoryGame(EmojiSet: 2, Difficulty: Difficulty.easy )
    }
    
    
    
    @Published private var model: MemoryGame<CardObjectWrapper>
    
    
    static func createMemoryGame(EmojiSet: Int,Difficulty: Difficulty)->MemoryGame<CardObjectWrapper> {
        
    
        
        var themes = [
            ["😀","😬","😁","😂","😃","😄","😅","😆","😇","😉","😊","🙂","🙃","☺️","😋","😌","😍","😘","😗","😙","😚","😜","😝","😛","🤑","🤓","😎","🤗","😏","😶","😐","😑","😒","🙄","🤔","😳","😞","😟","😠","😡","😔","😕","🙁","☹️","😣","😖","😫","😩","😤","😮","😱","😨","😰","😯","😦","😧","😢","😥","😪","😓","😭","😵","😲","🤐","😷","🤒","🤕","😴"],
            ["🐶","🐱","🐭","🐹","🐰","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐙","🐵","🙈","🙉","🙊","🐒","🐔","🐧","🐦","🐤","🐣","🐥","🐺","🐗","🐴","🦄","🐝","🐛","🐌","🐞","🐜","🕷","🦂","🦀","🐍","🐢","🐠","🐟","🐡","🐬","🐳","🐋","🐊","🐆","🐅","🐃","🐂","🐄","🐪","🐫","🐘","🐐","🐏","🐑","🐎","🐖","🐀","🐁","🐓","🦃","🕊","🐕","🐩","🐈","🐇","🐿","🐉","🐲"],
            [AnyView(Rectangle().fill(.red)),  AnyView(Circle().fill(.red)), AnyView(Hexagon().fill(.green).frame(width: 10, height: 10)), AnyView(Ellipse().fill(.green)), AnyView(Capsule()), AnyView(Triangle().fill(.red).frame(width: 10, height: 10))]
        ]
        
        for i in 0..<themes.count{
            for j in 0..<themes[i].count{
                themes[i][j] = CardObjectWrapper(id: j, obj: themes[i][j])
            }
        }
        
        let screenSize = Int(UIScreen.main.bounds.width)
        print(screenSize)
        let playingTheme = themes[EmojiSet].shuffled()[..<(Difficulty.rawValue )]
        
        return  MemoryGame<CardObjectWrapper>(numberOfPairsOfCards: playingTheme.count, cardContentFactory: { pairIndex in
            return playingTheme[pairIndex] as! CardObjectWrapper
        })
    }
    
    // MARK: - Access to the Model
    var cards: [MemoryGame<CardObjectWrapper>.Card]{
        return model.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<CardObjectWrapper>.Card){
        model.choose(card: card)
    }
    
    func newGame(EmojiSet: Int,Difficulty: Difficulty){
       model = EmojiMemoryGameViewModel.createMemoryGame(EmojiSet: EmojiSet, Difficulty: Difficulty)
    }
    
    func cardAmountDisplay(Difficulty: Difficulty, ScreenSize: Int, ElementAmount: Int) -> Int{
        
        return (Difficulty.rawValue * ScreenSize) % ElementAmount
        
    }
    
    func getScore()->Int{
        return model.scoreCounter
    }
    
    func getHighScore()->Int{
        return model.highScore
    }
    
}
