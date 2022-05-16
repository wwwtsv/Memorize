//
//  EmojiGame.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/16/22.
//

import Foundation

class EmojiGame {
    let emojiGameModel = GameModel<String>(numberOfPairs: 12) { cardIndex in
        createCardContent(cardIndex)
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
