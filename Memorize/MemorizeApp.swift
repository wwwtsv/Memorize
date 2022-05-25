//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/12/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let emojiGame = EmojiGame<[Color]>(colors: [Color.green, Color.blue, Color.cyan])
    var body: some Scene {
        WindowGroup {
            GameView(emojiGame: emojiGame)
        }
    }
}
