//
//  ContentView.swift
//  Dicee-SwiftUI-iOS16
//
//  Created by Amr Mohamad on 30/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDice: Int  = 1
    @State var rightDice: Int = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDice)
                    DiceView(n: rightDice)
                }
                Spacer()
                Button(action: {
                    self.leftDice  = Int.random(in: 1...6)
                    self.rightDice = Int.random(in: 1...6)
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


