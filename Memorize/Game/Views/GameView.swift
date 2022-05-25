//
//  ContentView.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/12/22.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var emojiGame: EmojiGame<[Color]>
    
    var body: some View {
        VStack {
            let currentTheme = emojiGame.currentTheme.name
            Text(currentTheme).font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(CGFloat(emojiGame.cards.count))))]) {
                    ForEach(emojiGame.cards) { card in
                        CardView(card: card, theme: emojiGame.currentTheme).aspectRatio(2/3, contentMode: .fit).onTapGesture {
                            emojiGame.choose(card)
                        }
                    }
                }
            }
            Spacer()
            Button(action: {
                emojiGame.createNewGame()
            }, label: {
                Text("New Game").font(.largeTitle)
            })
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
        let emojiGame = EmojiGame<[Color]>(colors: [Color.green, Color.blue, Color.cyan])
        GameView(emojiGame: emojiGame).preferredColorScheme(.light).previewInterfaceOrientation(.portrait)
        GameView(emojiGame: emojiGame).preferredColorScheme(.dark).previewInterfaceOrientation(.portrait)
    }
}
