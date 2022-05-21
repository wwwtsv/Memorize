//
//  EmojiGame.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/16/22.
//

import Foundation


class EmojiGame<Colors>: ObservableObject where Colors: Collection {
    typealias Themes = ThemeModel<String, Colors>
    let colors: Colors
    
    @Published var gameModel: GameModel<String>
    @Published var themeModel: Themes
    
    
    var cards: [GameModel<String>.Card] {
        gameModel.cards
    }
    
    var currentTheme: Themes.Theme {
        themeModel.currentTheme
    }
    
    init(colors: Colors) {
        let themeModel = ThemeModel(theme: theme, colors: colors)
        gameModel = GameModel(numberOfPairs: themeModel.currentTheme.numberOfPairs) { cardIndex in
            EmojiGame.createCardContent(cardIndex, themeModel.currentTheme)
        }
        self.themeModel = themeModel
        self.colors = colors
    }
    
    func choose(_ card: GameModel<String>.Card) {
        gameModel.choose(card)
    }
    
    func createNewGame() {
        let themeModel = ThemeModel(theme: theme, colors: colors)
        gameModel = GameModel(numberOfPairs: themeModel.currentTheme.numberOfPairs) { cardIndex in
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
