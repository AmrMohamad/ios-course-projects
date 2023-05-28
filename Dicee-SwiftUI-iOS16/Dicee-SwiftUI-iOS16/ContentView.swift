//
//  ContentView.swift
//  Dicee-SwiftUI-iOS16
//
//  Created by Amr Mohamad on 30/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: 1)
                    DiceView(n: 2)
                }
                Spacer()
                Button(action: {
                    
                }) {
                    Text("Roll")
                        .padding(.horizontal)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        
                }
                .background(Color.red)

            }
        }
    }
}

struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


