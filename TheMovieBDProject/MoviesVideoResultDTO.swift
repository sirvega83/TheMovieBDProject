//
//  MoviesVideoResultDTO.swift
//  TheMovieDBProject
//
//  Created by Said Vega Ibn Rouhou on 30/11/23.
//

import Foundation

struct MoviesVideoResultDTO: Codable {
    let results : [MovieVideosDTO]
}

struct MovieVideosDTO: Codable {
    let key: String
    let type: videoType
    let official: Bool

    var toPresentation: MovieVideoPresentation {
        MovieVideoPresentation(key: key, type: type, official: official)
        
    }
}

enum videoType: String, Codable {
    case trailer = "Trailer"
    case clip = "Clip"
    case behindTheScenes = "Behind the Scenes"
    case featurette = "Featurette"
    case teaser = "Teaser"
    case bloopers = "Bloopers"

}
