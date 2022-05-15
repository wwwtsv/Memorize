//
//  CardView.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/13/22.
//

import SwiftUI

struct CardView: View {
    @State var isOpen = true
    
    let emoji: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 24)
            
            if isOpen {
                shape.fill(.white)
                shape.strokeBorder(.red, lineWidth: 3)
                Text(emoji)
            } else {
                shape.fill(.red)
            }
        }.onTapGesture {
            isOpen = !isOpen
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(emoji: "🚗").frame(width: 180, height: 250, alignment: .center).preferredColorScheme(.dark).previewInterfaceOrientation(.portraitUpsideDown)
    }
}
