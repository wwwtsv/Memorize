//
//  EmojiGame.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/16/22.
//

import Foundation


class EmojiGame<Colors>: ObservableObject where Colors: Collection {
    typealias Themes = ThemeModel<String, Colors>
    typealias Card = MemoryGameModel<String>.Card
    let colors: Colors
    
    @Published var memoryGameModel: MemoryGameModel<String>
    var themeModel: Themes
    
    
    var cards: [Card] {
        memoryGameModel.cards
    }
    
    var currentTheme: Themes.Theme {
        themeModel.currentTheme
    }
    
    init(colors: Colors) {
        let themeModel = ThemeModel(theme: theme, colors: colors)
        memoryGameModel = MemoryGameModel(numberOfPairs: themeModel.currentTheme.numberOfPairs) { cardIndex in
            EmojiGame.createCardContent(cardIndex, themeModel.currentTheme)
        }
        self.themeModel = themeModel
        self.colors = colors
    }
    
    func choose(_ card: Card) {
        memoryGameModel.choose(card)
    }
    
    func createNewGame() {
        let themeModel = ThemeModel(theme: theme, colors: colors)
        memoryGameModel = MemoryGameModel(numberOfPairs: themeModel.currentTheme.numberOfPairs) { cardIndex in
            EmojiGame.createCardContent(cardIndex, themeModel.currentTheme)
        }
        self.themeModel = themeModel
    }
    
    private static func createCardContent(_ index: Int, _ currentTheme: Themes.Theme) -> String {
        return currentTheme.content[index]
    }
    
    
    private let theme: [String: [String]] = [
        "Faces": ["😞", "😔", "😟", "😕", "🙁", "☹️", "😣", "😖", "😫", "😩", "🥺", "😢", "😭", "😤", "😠"],
        "Gestures": ["👋", "🤚", "🖐", "✋", "🖖", "👌", "🤌", "🤏", "✌️", "🤞", "🤟"],
        "Cars": ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🛵", "🏍"],
        "Animals": ["🦧", "🦣", "🐘", "🦛", "🦏", "🐪", "🐫", "🦒", "🦘", "🦬", "🐃", "🐘", "🦛", "🦏" ],
        "Hearts": ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "💔", "❣️", "💕", "💞", "💓", "💗", "💖", "💘", "💝"],
        "Flags": ["🏳️‍🌈", "🏳️‍⚧️", "🏴‍☠️", "🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬",]
    ]
}
