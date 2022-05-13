//
//  ContentView.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/12/22.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        ZStack {
            CardView(emoji: "🚗")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
