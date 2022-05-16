//
//  ContentView.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/12/22.
//

import SwiftUI

struct GameView: View {
    @State var selectedTheme: [String] = theme[0]
    @State var cardQuantity = theme[0].count
    
    var currentTheme: [[String]] = theme
    
    static let theme = [
        ["👋", "🤚", "🖐", "✋", "🖖", "👌", "🤌", "🤏", "✌️", "🤞", "🤟", "🤘"],
        ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜"],
        ["🦧", "🦣", "🐘", "🦛", "🦏", "🐪", "🐫", "🦒", "🦘", "🦬", "🐃"]
    ]


    var body: some View {
        VStack {
            Text("Memorize").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(CGFloat(cardQuantity))))]) {
                    ForEach(selectedTheme[0..<cardQuantity], id: \.self) { item in
                        CardView(emoji: item).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                removeButton
                Spacer()
                shuffleButton
                Spacer()
                addButton
            }
            .font(.system(size: 18))
            .padding(.bottom, 1)
            HStack {
                ForEach(currentTheme[0..<currentTheme.count], id: \.self) { it in
                    themeSelector(theme: it, icon: Text("\(it[0])"))
                }
            }
        }.padding(.horizontal)
    }
    
    func widthThatBestFits(_ cardCount: CGFloat) -> CGFloat {
        let minimumSize: CGFloat = 65
        let maximumSize: CGFloat = 160
        let step: CGFloat = 12.5
        
        return CGFloat.maximum(minimumSize, maximumSize - step * cardCount)
    }
    
    
    func themeSelector(theme: [String], icon: Text) -> some View {
        Button {
            cardQuantity = Int.random(in: 0...theme.count)
            selectedTheme = theme.shuffled()
        } label: {
            icon.font(.largeTitle).padding(.horizontal)
        }.padding(.horizontal)
    }
    
    var addButton: some View {
        Button {
            cardQuantity = min(selectedTheme.count, cardQuantity + 1)
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var removeButton: some View {
        Button {
            cardQuantity = max(0, cardQuantity - 1)
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var shuffleButton: some View {
        Button {
            selectedTheme = selectedTheme.shuffled()
        } label: {
            Text("Shuffle")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().preferredColorScheme(.light).previewInterfaceOrientation(.portrait)
    }
}
