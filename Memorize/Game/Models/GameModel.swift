//
//  GameModel.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/16/22.
//

import Foundation

struct GameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    init(numberOfPairs: Int, createCardContent: (_ index: Int) -> CardContent) {
        cards = Array<Card>()
        
        for index in 0..<numberOfPairs {
            let cardContent = createCardContent(index)
            cards.append(Card(id: index * 2, content: cardContent))
            cards.append(Card(id: index * 2 + 1, content: cardContent))
        }
    }
    
    private var lastChosenCardIndex: Int?
    
    mutating func choose(_ chosenCard: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == chosenCard.id }),
           !cards[chosenIndex].isMatched, !cards[chosenIndex].isSelected {
            if let potentialMatchedIndex = lastChosenCardIndex {
                if cards[chosenIndex].content == cards[potentialMatchedIndex].content  {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchedIndex].isMatched = true
                }
                
                lastChosenCardIndex = nil
            } else {
                for cardIndex in cards.indices {
                    cards[cardIndex].isSelected = false
                }
                lastChosenCardIndex = chosenIndex
            }
            
            cards[chosenIndex].isSelected.toggle()
        }
    }
    
    struct Card: Identifiable {
        let id: Int
        var isSelected = false
        var isMatched = false
        let content: CardContent
    }
}
