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
 */
struct ContentView: View {
    
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        
        .font(.largeTitle)
        .foregroundColor(Color.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
            
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
