//
//  GameModel.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/16/22.
//

import Foundation

struct GameModel<CardContent> {
    private(set) var cards: [Card]
    
    init(numberOfPairs: Int, createCardContent: (_ index: Int) -> CardContent) {
        cards = Array<Card>()
        
        for index in 0...numberOfPairs {
            let cardContent = createCardContent(index)
            cards.append(Card(content: cardContent))
            cards.append(Card(content: cardContent))
        }
    }
    
    struct Card {
        let isSelected = false
        let isMatched = false
        let content: CardContent
    }
}
