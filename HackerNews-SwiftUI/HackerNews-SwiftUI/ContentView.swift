//
//  ContentView.swift
//  HackerNews-SwiftUI
//
//  Created by Amr Mohamad on 30/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            List(posts){ post in
                Text(post.title)
            }
            .navigationTitle("HACKER NEWS")
            .listStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

