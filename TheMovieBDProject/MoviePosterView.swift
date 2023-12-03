//
//  MoviePosterView.swift
//  TheMovieDBProject
//
//  Created by Said Vega Ibn Rouhou on 27/11/23.
//

import SwiftUI

enum PosterSize: CGFloat {
    case cellPoster = 100
    case detailPoster = 300
}

struct MoviePosterView: View {
    let movie: Movie
    
    var size: PosterSize = .cellPoster
    
    var body: some View {
        AsyncImage(url: movie.imageMovie ) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: size.rawValue)
        } placeholder: {
            Image(systemName: "movieclapper")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding(.trailing, 20)
        }
        
    }
}

#Preview {
    MoviePosterView(movie: .testMovie)
}
