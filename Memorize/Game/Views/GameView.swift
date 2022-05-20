//
//  ContentView.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/12/22.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var emojiGame = EmojiGame()

    var body: some View {
        VStack {
            Text("Memorize").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(CGFloat(emojiGame.cards.count))))]) {
                    ForEach(emojiGame.cards) { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit).onTapGesture {
                            emojiGame.choose(card)
                        }
                    }
                }
            }
        }.padding()
    }
    
    func widthThatBestFits(_ cardCount: CGFloat) -> CGFloat {
        let minimumSize: CGFloat = 65
        let maximumSize: CGFloat = 160
        let step: CGFloat = 12.5
        
        return CGFloat.maximum(minimumSize, maximumSize - step * cardCount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().preferredColorScheme(.light).previewInterfaceOrientation(.portrait)
    }
}
