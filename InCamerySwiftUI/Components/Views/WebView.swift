//
//  WebView.swift
//  InCamerySwiftUI
//
//  Created by Artem Denis on 22.10.2021.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    let url: String?
    
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKPreferences()
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        let webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = url, let requestUrl = URL(string: url) else { return }
        let request = URLRequest(url: requestUrl)
        webView.load(request)
    }
}
