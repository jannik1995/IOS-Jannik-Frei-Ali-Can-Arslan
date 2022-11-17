import Foundation
import SwiftUI

class EmojiMemoryGameViewModel: ObservableObject {
    
    init() {
        model = EmojiMemoryGameViewModel.createMemoryGame(EmojiSet: 2, Difficulty: Difficulty.easy )
    }
    
    @Published private var model: MemoryGame<CardObjectWrapper>
    
    
    static func createMemoryGame(EmojiSet: Int,Difficulty: Difficulty)->MemoryGame<CardObjectWrapper> {
    
        let colors = [Color.red, Color.blue, Color.green, Color.yellow, Color.black, Color.pink, Color.brown, Color.cyan, Color.purple]
    
        var shapes:[AnyView] = []
        
        for i in 0..<colors.count{
            shapes.append(AnyView(Rectangle().fill(colors[i]).frame(width: 40, height: 40)))
            shapes.append(AnyView(Circle().fill(colors[i]).frame(width: 40, height: 40)))
            shapes.append(AnyView(Hexagon().fill(colors[i]).frame(width: 40, height: 40)))
            shapes.append(AnyView(Triangle().fill(colors[i]).frame(width: 40, height: 40)))
        }
        
        var themes: [[Any]] = [
            ["😀","😬","😁","😂","😃","😄","😅","😆","😇","😉","😊","🙂","🙃","☺️","😋","😌","😍","😘","😗","😙","😚","😜","😝","😛","🤑","🤓","😎","🤗","😏","😶","😐","😑","😒","🙄","🤔","😳","😞","😟","😠","😡","😔","😕","🙁","☹️","😣","😖","😫","😩","😤","😮","😱","😨","😰","😯","😦","😧","😢","😥","😪","😓","😭","😵","😲","🤐","😷","🤒","🤕","😴"],
            ["🐶","🐱","🐭","🐹","🐰","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐙","🐵","🙈","🙉","🙊","🐒","🐔","🐧","🐦","🐤","🐣","🐥","🐺","🐗","🐴","🦄","🐝","🐛","🐌","🐞","🐜","🕷","🦂","🦀","🐍","🐢","🐠","🐟","🐡","🐬","🐳","🐋","🐊","🐆","🐅","🐃","🐂","🐄","🐪","🐫","🐘","🐐","🐏","🐑","🐎","🐖","🐀","🐁","🐓","🦃","🕊","🐕","🐩","🐈","🐇","🐿","🐉","🐲"],
            ["🇦🇫","🇦🇽","🇦🇱","🇩🇿","🇦🇸","🇦🇩","🇦🇴","🇦🇮","🇦🇶","🇦🇬","🇦🇷","🇦🇲","🇦🇼","🇦🇺","🇦🇹","🇦🇿","🇧🇸","🇧🇭","🇧🇩","🇧🇧","🇧🇾","🇧🇪","🇧🇿","🇧🇯","🇧🇲","🇧🇹","🇧🇴","🇧🇶","🇧🇦","🇧🇼","🇧🇷","🇮🇴","🇻🇬","🇧🇳","🇧🇬","🇧🇫","🇧🇮","🇨🇻","🇰🇭","🇨🇲","🇨🇦","🇮🇨","🇰🇾","🇨🇫","🇹🇩","🇨🇱","🇨🇳","🇨🇽","🇨🇨","🇨🇴","🇰🇲","🇨🇬","🇨🇩","🇨🇰","🇨🇷","🇭🇷","🇨🇺","🇨🇼","🇨🇾","🇨🇿","🇩🇰","🇩🇯","🇩🇲","🇩🇴","🇪🇨","🇪🇬","🇸🇻","🇬🇶","🇪🇷","🇪🇪","🇪🇹","🇪🇺","🇫🇰","🇫🇴","🇫🇯","🇫🇮","🇫🇷","🇬🇫","🇵🇫","🇹🇫","🇬🇦","🇬🇲","🇬🇪","🇩🇪","🇬🇭","🇬🇮","🇬🇷","🇬🇱","🇬🇩","🇬🇵","🇬🇺","🇬🇹","🇬🇬","🇬🇳","🇬🇼","🇬🇾","🇭🇹","🇭🇳","🇭🇰","🇭🇺","🇮🇸","🇮🇳","🇮🇩","🇮🇷","🇮🇶","🇮🇪","🇮🇲","🇮🇱","🇮🇹","🇨🇮","🇯🇲","🇯🇵","🇯🇪","🇯🇴","🇰🇿","🇰🇪","🇰🇮","🇽🇰","🇰🇼","🇰🇬","🇱🇦","🇱🇻","🇱🇧","🇱🇸","🇱🇷","🇱🇾","🇱🇮","🇱🇹","🇱🇺","🇲🇴","🇲🇰","🇲🇬","🇲🇼","🇲🇾","🇲🇻","🇲🇱","🇲🇹","🇲🇭","🇲🇶","🇲🇷","🇲🇺","🇾🇹","🇲🇽","🇫🇲","🇲🇩","🇲🇨","🇲🇳","🇲🇪","🇲🇸","🇲🇦","🇲🇿","🇲🇲","🇳🇦","🇳🇷","🇳🇵","🇳🇱","🇳🇨","🇳🇿","🇳🇮","🇳🇪","🇳🇬","🇳🇺","🇳🇫","🇲🇵","🇰🇵","🇳🇴","🇴🇲","🇵🇰","🇵🇼","🇵🇸","🇵🇦","🇵🇬","🇵🇾","🇵🇪","🇵🇭","🇵🇳","🇵🇱","🇵🇹","🇵🇷","🇶🇦","🇷🇪","🇷🇴","🇷🇺","🇷🇼","🇧🇱","🇸🇭","🇰🇳","🇱🇨","🇵🇲","🇻🇨","🇼🇸","🇸🇲","🇸🇹","🇸🇦","🇸🇳","🇷🇸","🇸🇨","🇸🇱","🇸🇬","🇸🇽","🇸🇰","🇸🇮","🇸🇧","🇸🇴","🇿🇦","🇬🇸","🇰🇷","🇸🇸","🇪🇸","🇱🇰","🇸🇩","🇸🇷","🇸🇿","🇸🇪","🇨🇭","🇸🇾","🇹🇼","🇹🇯","🇹🇿","🇹🇭","🇹🇱","🇹🇬","🇹🇰","🇹🇴","🇹🇹","🇹🇳","🇹🇷","🇹🇲","🇹🇨","🇹🇻","🇺🇬","🇺🇦","🇦🇪","🇬🇧","🇺🇸","🇻🇮","🇺🇾","🇺🇿","🇻🇺","🇻🇦","🇻🇪","🇻🇳","🇼🇫","🇪🇭","🇾🇪,","🇿🇲","🇿🇼"]
        ]
        
        themes.append(shapes)
        
        for i in 0..<themes.count{
            for j in 0..<themes[i].count{
                themes[i][j] = CardObjectWrapper(id: j, obj: themes[i][j])
            }
        }
        
        let screenSize = Int(UIScreen.main.bounds.width)

        let cardAmount: Int = cardAmountDisplay(Difficulty: Difficulty, ScreenSize: screenSize)
        let playingTheme = themes[EmojiSet].shuffled()[..<(cardAmount)]
        
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
    
    static func cardAmountDisplay(Difficulty: Difficulty, ScreenSize: Int) -> Int{
        var amount:Int = 0
        if(ScreenSize < 400){
            amount = Difficulty.rawValue
        } else {
            amount = Difficulty.rawValue * 2
        }
        return amount
    }
    
    func getScore()->Int{
        return model.scoreCounter
    }
    
    func getHighScore()->Int{
        return model.highScore
    }
    
}
