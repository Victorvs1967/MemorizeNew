//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Victor Smirnov on 07.09.2022.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card

    private static let emojis = ["🚁", "✈️", "🚀", "🛩", "🚗", "🚕", "🚙", "🚌", "🚒", "🚑", "🚓", "🚎", "🚜", "🚃", "🛰", "⛵️", "🚠", "🏍", "🚛", "🚚", "🛵", "🛥", "🚲", "🚐"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
                emojis[pairIndex]
            }
    }
 
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent
    func choose(_ card: Card) {
        objectWillChange.send()
        model.choose(card)
    }
    
}

