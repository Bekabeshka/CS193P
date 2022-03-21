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
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(gameViewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                gameViewModel.choose(card)
                            }
                    }
                }
                .foregroundColor(.purple)
            }
//            Spacer()
//            HStack {
//                remove
//                Spacer()
//                add
//            }
//            .font(.largeTitle)
//            .padding(.horizontal)
        }
        .padding()
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
