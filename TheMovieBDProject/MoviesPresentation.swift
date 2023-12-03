//
//  Presentation.swift
//  TheMovieBDProject
//
//  Created by Said Vega Ibn Rouhou on 23/11/23.
//

import Foundation

struct Movie: Identifiable, Hashable, Codable {
    let id: Int
    let originalTitle: String
    let title: String
    let overview: String
    let releaseDate: Date
    let voteAverage: Double
    let posterPath: String
    
    var imageMovie: URL {
        mainImageURL.appending(path: posterPath)
    }
    
    var trailerMovie: URL {
        URL(string: "https://www.youtube.com/watch?v=1QbZvmHBDF4&t=4s")!
    }
    
    var averageMovie: String {
         voteAverage.formatted(.number.precision(.fractionLength(1)))
    }
    
    var averageMovieRate: Double {
        voteAverage / 10
    }
    
    var movieLink: URL {
        mainURL.appending(path: "\(id)")
    }

}

