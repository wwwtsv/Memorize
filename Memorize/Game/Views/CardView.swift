//
//  CardView.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/13/22.
//

import SwiftUI

struct CardView: View {
    let card: GameModel<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 24)
            
            if card.isSelected {
                shape.fill(.white)
                shape.strokeBorder(.red, lineWidth: 3)
                Text(card.content)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill(.red)
            }
        }
    }
}
