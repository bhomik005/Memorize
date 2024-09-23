//
//  ContentView.swift
//  Memorize
//
//  Created by bhomik kinger on 20/9/2024.
//

import SwiftUI

/**
 
 In Swift UI , a struct can have variables and functions and a struct is a composite data types
 Content View is a struct and it  conforms to protocol View (it behaves like a View / functions like a View)
 If you want to behave like a View, you must have a var body which behaves like some View
 body is a computed property (readonly) - its value gets computed when someone ask for the value of body as it is not a stored value
 the type of this body could be any struct in the world as long as it behaves like a View
 Never have a function more than 20 lines of code ( 12 lines preferrably)
 Views are immutable ( we use state var to change the views)
 Array out of bounds is a crasher in swift
 */
struct ContentView: View {
    let emojis : [String] = ["👻", "🎃", "💀", "🕷️", "🤖", "🚀", "🚎", "👽", "😭"]
    @State var cardCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self ) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(Color.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset

        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}
// let is a constant (cannot change once assigned a value)
// var is a variable
struct CardView: View {
    let content: String // let content - because there is no default value for this one
    @State var isFaceUp = true // state variable
    var body: some View {
        ZStack {
            // type inference in Swift
            let base = RoundedRectangle(cornerRadius: 12)
            // Group is a bag of legos - allows us to apply opacity
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1) // 0 -> fully transparent, 1 -> fully opaque
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
