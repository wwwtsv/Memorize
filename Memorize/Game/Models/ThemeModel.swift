//
//  ThemeModel.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/21/22.
//

import Foundation

struct ThemeModel<Content, Colors> where Colors: Collection {
    private(set) var theme: [Theme]
    private(set) var currentTheme: Theme
    
    init(theme: [String: [Content]], colors: Colors) {
        self.theme = Array<Theme>()
        
        for (name, content) in theme {
            let theme =
            Theme(name, content, numberOfPairs: Int.random(in: 2..<theme.count), color: colors.randomElement()!)
            self.theme.append(theme)
        }
        
        self.currentTheme = self.theme.randomElement()!
    }
    
    
    struct Theme {
        let name: String
        let content: [Content]
        let numberOfPairs: Int
        let color: Colors.Element
        
        init(_ name: String, _ content: [Content], numberOfPairs: Int, color: Colors.Element) {
            self.name = name
            self.content = content.shuffled()
            self.numberOfPairs = numberOfPairs
            self.color = color
        }
    }
}
