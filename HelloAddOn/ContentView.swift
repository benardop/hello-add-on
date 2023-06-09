//
//  ContentView.swift
//  HelloAddOn
//
//  Created by user241871 on 5/29/23.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var isShowingWebView = false
    
    var body: some View {
        VStack {
            if isShowingWebView {
                WebView(urlString: Bundle.main.path(forResource: "index", ofType: "html")!)
                    .frame(height: 300)
            }
            
            Button(action: {
                isShowingWebView.toggle()
            }) {
                Text(isShowingWebView ? "Hide Web View" : "Show Web View")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WebView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
