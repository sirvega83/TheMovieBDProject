//
//  ModelDTO.swift
//  TheMovieBDProject
//
//  Created by Said Vega Ibn Rouhou on 23/11/23.
//

import Foundation

struct MoviesResultDTO: Codable {
    let page: Int
    let results: [MovieDTO]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieDTO: Codable {
    let id: Int
    let originalTitle: String
    let title: String
    let overview: String
    let releaseDate: Date
    let voteAverage: Double
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
    }
    
    var toPresentation: Movie {
        Movie(id: id, 
                 originalTitle: originalTitle,
                 title: title,
                 overview: overview,
                 releaseDate: releaseDate,
                 voteAverage: voteAverage,
                 posterPath: posterPath)
    }
}
