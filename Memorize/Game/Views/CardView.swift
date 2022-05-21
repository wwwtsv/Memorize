//
//  CardView.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/13/22.
//

import SwiftUI

struct CardView: View {
    let card: GameModel<String>.Card
    let theme: ThemeModel<String, [Color]>.Theme
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 24)
            
            if card.isSelected {
                shape.fill(.white)
                shape.strokeBorder(theme.color, lineWidth: 3)
                Text(card.content)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill(theme.color)
            }
        }
    }
}
