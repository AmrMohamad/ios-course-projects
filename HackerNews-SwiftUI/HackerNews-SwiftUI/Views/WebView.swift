//
//  WebView.swift
//  HackerNews-SwiftUI
//
//  Created by Amr Mohamad on 31/05/2023.
//

import SwiftUI
import WebKit

struct WebView:UIViewRepresentable {
    let urlString: String?
    
    typealias UIViewType = WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let safeUrlString = urlString {
            if let url = URL(string: safeUrlString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
