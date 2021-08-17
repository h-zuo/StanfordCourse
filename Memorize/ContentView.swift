//
//  ContentView.swift
//  Memorize
//
//  Created by Helen Zuo on 16/8/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var vehicles = ["🚂","✈️","🚙","🚀","🚁","🛳","🚕","⛵️","🚠"]
    var food = ["🍑","🍛","🍦","🧇","🍔","🌭","🌯","🍗","🍣"]
    var face = ["🥺","😘","🙄","😁","😡","🙃","🤮","🥵","😉","🥳"]
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                            CardView(card: card)
                                .aspectRatio(2/3, contentMode: .fit)
                                .onTapGesture {
                                    viewModel.choose(card)
                                }
                }
            }
            .foregroundColor(.red)
            .font(.largeTitle)
            .padding(.horizontal)
            Spacer()
        }
        .padding(.horizontal)

    }

}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)

            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
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
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
