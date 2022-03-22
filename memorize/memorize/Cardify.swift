//
//  Cardify.swift
//  memorize
//
//  Created by Бекдаулет Касымов on 22.03.2022.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: Constants.lineWidth)
            } else {
                shape.fill()
            }
            content.opacity(isFaceUp ? 1: 0)
        }
    }
    
    enum Constants {
        static let cornerRadius: CGFloat = 25
        static let lineWidth: CGFloat = 3
    }
}
