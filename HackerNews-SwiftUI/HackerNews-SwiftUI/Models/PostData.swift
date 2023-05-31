//
//  PostData.swift
//  HackerNews-SwiftUI
//
//  Created by Amr Mohamad on 31/05/2023.
//

import Foundation
struct Results: Codable {
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    var id       : String {
        return objectID
    }
    let objectID : String
    let title    : String
    let url      : String?
    let points   : Int
}
