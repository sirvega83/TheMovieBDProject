//
//  MoviesCellView.swift
//  TheMovieBDProject
//
//  Created by Said Vega Ibn Rouhou on 25/11/23.
//

import SwiftUI

struct MoviesCellView: View {
    
    let movie: Movie
 
    var body: some View {
       
        HStack{
            MoviePosterView(movie: movie, size: .cellPoster)
                .overlay(alignment: .bottomTrailing) {
                    AverageCircleView(movie: movie, size: false)
                }
            HStack(alignment: .center){
                Text("\(movie.originalTitle)")
                    .font(.headline)
               
                
            }
        }
    }
}

#Preview {
    MoviesCellView(movie: .testMovie)
}

