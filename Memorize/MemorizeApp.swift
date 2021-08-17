//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Helen Zuo on 16/8/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame() //can use let because it's a pointer
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
