//
//  CardView.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/13/22.
//

import SwiftUI

struct CardView: View {
    let card: EmojiGame.Card
    let theme: ThemeModel<String, [Color]>.Theme
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: CardConst.shapeRadius)
                
                if card.isSelected {
                    shape.fill(.white)
                    shape.strokeBorder(theme.color, lineWidth: CardConst.lineWidth)
                    Text(card.content).font(.system(size: geometry.size.width * 0.8))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill(theme.color)
                }
            }
        }
    }
    
    struct CardConst {
        static let shapeRadius: CGFloat = 24
        static let lineWidth : CGFloat = 3
    }
}
