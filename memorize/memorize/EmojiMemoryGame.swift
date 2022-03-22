//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Бекдаулет Касымов on 21.03.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static private let emojis = ["🗿", "🗽", "🎡", "🗼", "🚗", "🚕", "🚙", "🚌", "🏎", "🚓", "🚑", "🚒"]
    static private func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { index in
            EmojiMemoryGame.emojis[index]
        }
    }
    
    @Published private var memoryGame = createMemoryGame()
    
    var cards: [Card] {
        return memoryGame.cards
    }
    
    func choose(_ card: Card) {
        memoryGame.choose(card: card)
    }
}
