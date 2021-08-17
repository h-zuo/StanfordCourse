//
//  ContentView.swift
//  Memorize
//
//  Created by Helen Zuo on 16/8/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojiCount = 6
    
    var vehicles = ["🚂","✈️","🚙","🚀","🚁","🛳","🚕","⛵️","🚠"]
    var food = ["🍑","🍛","🍦","🧇","🍔","🌭","🌯","🍗","🍣"]
    var face = ["🥺","😘","🙄","😁","😡","🙃","🤮","🥵","😉","🥳"]
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(emojis, id: \.self, content: { emoji in
                            CardView(content: emoji)}).aspectRatio(2/3, contentMode: .fit)
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                vehicleTheme
                Spacer()
                foodTheme
                Spacer()
                faceTheme
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)

    }
    
    var vehicleTheme: some View {
        Button {
            emojis = vehicles
        } label: {
            VStack{
                Image(systemName: "car")
                Text("Vehicles").font(.caption)
            }
        }
    }
    
    var foodTheme: some View {
        Button {
            emojis = food
        } label: {
            VStack {
                Image(systemName: "mouth")
                Text("Food").font(.caption)

            }
        }
    }
    
    var faceTheme: some View {
        Button{
            emojis = face
        } label: {
            VStack {
                Image(systemName: "face.smiling")
                Text("Emoji").font(.caption)
            }
        }
        
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)

            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
