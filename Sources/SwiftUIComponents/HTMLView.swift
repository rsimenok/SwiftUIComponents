//
//  HTMLView.swift
//  SwiftUIComponents
//
//  Created by Moi Gutierrez on 3/14/22.
//

import SwiftUI
import WebKit

struct HTMLView: View {
    @Binding var htmlText: String
    
    var body: some View {
        WebView(text: $htmlText)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct WebView: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(text, baseURL: nil)
    }
}

struct HTMLView_Previews: PreviewProvider {
        
    static var previews: some View {
        HTMLView(htmlText: .constant(
"""
<html>
<body>
<h1>
Hello World
</h1>
</body>
</html>
"""
        ))
    }
}
