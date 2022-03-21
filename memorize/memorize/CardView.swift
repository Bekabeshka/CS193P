//
//  CardView.swift
//  memorize
//
//  Created by Бекдаулет Касымов on 21.03.2022.
//

import SwiftUI

struct CardView: View {
    let title: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(title)
                    .font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}
