//
//  ContentView.swift
//  AmrCard-SwiftUI
//
//  Created by Amr Mohamad on 29/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.12, blue: 0.22)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("amrImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160.0, height: 160.0)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color.white, lineWidth: 3)
                    }.shadow(radius: 5)
                
                Text("Amr Mohamad")
                    .font(Font.custom(
                            "DancingScript-Regular",
                            size: 40)
                    )
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                Divider()
                InfoView(text: "+20 109 711 3136",
                         imageName: "phone.fill")
                InfoView(text: "amr.mohamed124124@gamil.com",
                         imageName: "envelope.fill")
                    
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

