//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Victor Smirnov on 07.09.2022.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {

    static let emojis = ["🚁", "✈️", "🚀", "🛩", "🚗", "🚕", "🚙", "🚌", "🚒", "🚑", "🚓", "🚎", "🚜", "🚃", "🛰", "⛵️", "🚠", "🏍", "🚛", "🚚", "🛵", "🛥", "🚲", "🚐"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
                emojis[pairIndex]
            }
    }
 
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
    
}

