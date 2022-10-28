import Foundation

class EmojiMemoryGameViewModel: ObservableObject {
    
    init() {
        model = EmojiMemoryGameViewModel.createMemoryGame(EmojiSet: 0, Difficulty: "Leicht" )
    }
    
    @Published private var model: MemoryGame<String>
    
    
    static func createMemoryGame(EmojiSet: Int,Difficulty: String)->MemoryGame<String> {
        
        let themes = [
            ["😀","😬","😁","😂","😃","😄","😅","😆","😇","😉","😊","🙂","🙃","☺️","😋","😌","😍","😘","😗","😙","😚","😜","😝","😛","🤑","🤓","😎","🤗","😏","😶","😐","😑","😒","🙄","🤔","😳","😞","😟","😠","😡","😔","😕","🙁","☹️","😣","😖","😫","😩","😤","😮","😱","😨","😰","😯","😦","😧","😢","😥","😪","😓","😭","😵","😲","🤐","😷","🤒","🤕","😴"],
            ["🐶","🐱","🐭","🐹","🐰","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐙","🐵","🙈","🙉","🙊","🐒","🐔","🐧","🐦","🐤","🐣","🐥","🐺","🐗","🐴","🦄","🐝","🐛","🐌","🐞","🐜","🕷","🦂","🦀","🐍","🐢","🐠","🐟","🐡","🐬","🐳","🐋","🐊","🐆","🐅","🐃","🐂","🐄","🐪","🐫","🐘","🐐","🐏","🐑","🐎","🐖","🐀","🐁","🐓","🦃","🕊","🐕","🐩","🐈","🐇","🐿","🐉","🐲"]
            ]
        
        let playingTheme = themes[EmojiSet]
        
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
    
    func newGame(EmojiSet: Int,Difficulty: String){
       model = EmojiMemoryGameViewModel.createMemoryGame(EmojiSet: EmojiSet, Difficulty: Difficulty)
    }
    
}
