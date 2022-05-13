//
//  CardView.swift
//  Memorize
//
//  Created by Алексей Цветков on 5/13/22.
//

import SwiftUI

struct CardView: View {
    let emoji: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.red, lineWidth: 3)
                .padding(.all)
            Text(emoji)
        }.padding(.vertical)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(emoji: "🚗")
    }
}
