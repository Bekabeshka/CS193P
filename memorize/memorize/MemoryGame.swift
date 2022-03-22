//
//  MemoryGame.swift
//  memorize
//
//  Created by Бекдаулет Касымов on 21.03.2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card] = []
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) }
        }
    }
    
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
                cards[selectedIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = selectedIndex
            }
        }
    }
    
    struct Card: Identifiable {
        let id: Int
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
