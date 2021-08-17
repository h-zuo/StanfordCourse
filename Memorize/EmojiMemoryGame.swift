//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Helen Zuo on 17/8/21.
//

import SwiftUI


// ViewModel
class EmojiMemoryGame {
    
    static let emojis = ["🚂","✈️","🚙","🚀","🚁","🛳","🚕","⛵️","🚠"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: {pairIndex in
            emojis[pairIndex]
        })
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    // public method to get
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
