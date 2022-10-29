//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Victor Smirnov on 15.05.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
