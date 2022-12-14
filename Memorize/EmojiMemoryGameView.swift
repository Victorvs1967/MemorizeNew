//
//  ContentView.swift
//  Memorize
//
//  Created by Victor Smirnov on 15.05.2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        game.choose(card)
                    }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 16.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
       }
    }
}














struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(game: game)
                .preferredColorScheme(.light)
//            ContentView(viewModel: game)
//                .preferredColorScheme(.light)
        }
     }
}
