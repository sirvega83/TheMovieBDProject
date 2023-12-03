//
//  YoutubePlayer.swift
//  TheMovieDBProject
//
//  Created by Said Vega Ibn Rouhou on 30/11/23.
//

import SwiftUI
import WebKit

//mete una vista de UIkit en Swiftui

struct YoutubePlayer: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
  
    //crea la llamada para abrir en nuestra app la web que le pasemos
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

