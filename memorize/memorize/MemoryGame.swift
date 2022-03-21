//
//  MemoryGame.swift
//  memorize
//
//  Created by Бекдаулет Касымов on 21.03.2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card] = []
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    mutating func choose(card: Card) {
        if let selectedIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[selectedIndex].isFaceUp,
            !cards[selectedIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[selectedIndex].content == cards[potentialMatchIndex].content {
                    cards[selectedIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = selectedIndex
            }
            cards[selectedIndex].isFaceUp.toggle()
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
