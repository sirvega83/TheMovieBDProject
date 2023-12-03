//
//  MovieCastInteractor.swift
//  TheMovieDBProject
//
//  Created by Said Vega Ibn Rouhou on 28/11/23.
//

import Foundation


protocol CastMemberInteractorProtocol {
    func getCast(id: Int) async throws -> [CastMember]
    func getMovieTrailer(movieID: Int) async throws -> [MovieVideoPresentation]
}

struct CastMemberInteractor: CastMemberInteractorProtocol {
    func getCast(id: Int) async throws -> [CastMember] {
        try await getJSON(request: .getCustom(url: .getMovieCastCrew(id: id)), type: CastCrewDTO.self).cast.map(\.toSecondoPresentation)
        
    }
    
    func getMovieTrailer(movieID: Int) async throws -> [MovieVideoPresentation] {
         try await getJSON(request: .getCustom(url: .getTrailerMovie(id: movieID)), type: MoviesVideoResultDTO.self).results.map(\.toPresentation)
    }
}
