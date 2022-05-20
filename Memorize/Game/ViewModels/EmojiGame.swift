//
//  EmojiGame.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/16/22.
//

import Foundation

class EmojiGame: ObservableObject {
    @Published var emojiGameModel = GameModel<String>(numberOfPairs: 2) { cardIndex in
        createCardContent(cardIndex)
    }
    
    func choose(_ card: GameModel<String>.Card) {
        emojiGameModel.choose(card)
    }
    
    var cards: [GameModel<String>.Card] {
        emojiGameModel.cards
    }
    
    static let theme = [
        ["👋", "🤚", "🖐", "✋", "🖖", "👌", "🤌", "🤏", "✌️", "🤞", "🤟", "🤘"],
        ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜"],
        ["🦧", "🦣", "🐘", "🦛", "🦏", "🐪", "🐫", "🦒", "🦘", "🦬", "🐃"]
    ]
    
    static func createCardContent(_ index: Int) -> String {
        let selectedTheme = 0;
        return theme[selectedTheme][index]
    }
}
