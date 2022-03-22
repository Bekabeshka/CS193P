//
//  CardView.swift
//  memorize
//
//  Created by Бекдаулет Касымов on 21.03.2022.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        let startAngle = Angle(degrees: -90)
        let endAngle = Angle(degrees: 110 - 90)
        GeometryReader { geometry in
            ZStack {
                Pie(startAngle: startAngle, endAngle: endAngle)
                    .padding(5)
                    .opacity(0.5)
                Text(card.content)
                    .font(font(in: geometry.size))
            }.cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * Constants.fontScale)
    }
    
    enum Constants {
        static let fontScale: CGFloat = 0.7
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: .init(id: 1, content: "✈️"))
    }
}

fileprivate extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
