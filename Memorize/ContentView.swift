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
 */
struct ContentView: View {
    
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
        }
        .foregroundColor(Color.orange)
        .padding()
    }
}
// let is a constant (cannot change once assigned a value)
// var is a variable
struct CardView: View {
    @State var isFaceUp = false // state variable
    var body: some View {
        ZStack {
            // type inference in Swift
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                base.fill() // fill is a default
            }
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
