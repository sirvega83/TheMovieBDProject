//
//  MovieInteractor.swift
//  TheMovieBDProject
//
//  Created by Said Vega Ibn Rouhou on 23/11/23.
//

import Foundation

protocol MovieInteractorProtocol {
    func getMovies(page: Int) async throws -> [Movie]
}

struct MovieInteractor: MovieInteractorProtocol {
    func getMovies(page: Int) async throws -> [Movie] {
        try await getJSON(request: .getPaginatedMovies(url: .getPopularMovies, page: page), type: MoviesResultDTO.self).results.map(\.toPresentation)
    }
}



