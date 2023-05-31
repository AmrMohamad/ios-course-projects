//
//  DetailsView.swift
//  HackerNews-SwiftUI
//
//  Created by Amr Mohamad on 31/05/2023.
//

import SwiftUI
import WebKit

struct DetailsView: View {
    var url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "https://www.apple.com")
    }
}


