//
//  GameModel.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/16/22.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card] = []
    private(set) var score: Int = 0
    private var alreadySeenCards: [Card] = []
    
    init(numberOfPairs: Int, createCardContent: (_ index: Int) -> CardContent) {
        for index in 0..<numberOfPairs {
            let cardContent = createCardContent(index)
            cards.append(Card(id: index * 2, content: cardContent))
            cards.append(Card(id: index * 2 + 1, content: cardContent))
        }
        
        cards = cards.shuffled()
    }
    
    private var lastChosenCardIndex: Int? {
        cards.indices.filter({ cards[$0].isSelected }).oneAndOnly
    }
    
    
    mutating func choose(_ chosenCard: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == chosenCard.id }),
           !cards[chosenIndex].isMatched,
           !cards[chosenIndex].isSelected {
            if let potentialMatchedCardIndex = lastChosenCardIndex {
                cards[chosenIndex].isSelected = true
                if cards[chosenIndex].content == cards[potentialMatchedCardIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchedCardIndex].isMatched = true
                    alreadySeenCards = alreadySeenCards.filter { card in
                        card.id != chosenIndex || card.id != potentialMatchedCardIndex
                    }
                    score += 2
                } else {
                    alreadySeenCards = alreadySeenCards.filter { card in
                        if card.id == cards[chosenIndex].id || card.id == cards[potentialMatchedCardIndex].id {
                            score -= 1
                            return false
                        }
                        return true
                    }
                }
                for cardId in [chosenIndex, potentialMatchedCardIndex] {
                    if !alreadySeenCards.contains(where: { $0.id == cards[cardId].id }) {
                        alreadySeenCards.append(cards[cardId])
                    }
                }
            } else {
                cards.indices.forEach { cards[$0].isSelected = ($0 == chosenIndex) }
            }
        }
    }
    
    struct Card: Identifiable {
        let id: Int
        let content: CardContent
        var isSelected = false
        var isMatched = false
    }
}


extension Array {
    var oneAndOnly: Element? {
        count == 1 ? first : nil
    }
}
