//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Бекдаулет Касымов on 21.03.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static private let emojis = ["🗿", "🗽", "🎡", "🗼", "🚗", "🚕", "🚙", "🚌", "🏎", "🚓", "🚑", "🚒"]
    static private func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { index in
            EmojiMemoryGame.emojis[index]
        }
    }
    
    @Published private var memoryGame = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return memoryGame.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        memoryGame.choose(card: card)
    }
}
