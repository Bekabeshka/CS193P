//
//  EmojiMemoryGameView.swift
//  memorize
//
//  Created by Бекдаулет Касымов on 21.03.2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var gameViewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            AspectVGrid(items: gameViewModel.cards, aspectRatio: 2/3) { card in
                createCardView(card: card)
            }
        }
        .foregroundColor(.purple)
        .padding()
    }
    
    @ViewBuilder
    private func createCardView(card: EmojiMemoryGame.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    gameViewModel.choose(card)
            }
        }        
    }
    
//    var remove: some View {
//        Button(action: {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        }, label: {
//            Image(systemName: "minus.circle")
//        })
//    }
//
//    var add: some View {
//        Button(action: {
//            if emojiCount < viewModel.cards.count {
//                emojiCount += 1
//            }
//        }, label: {
//            Image(systemName: "plus.circle")
//        })
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(gameViewModel: game)
    }
}
