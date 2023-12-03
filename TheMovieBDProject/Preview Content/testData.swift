//
//  testData.swift
//  TheMovieBDProject
//
//  Created by Said Vega Ibn Rouhou on 24/11/23.
//

import Foundation

extension Movie {
    static let testMovie = Movie(id: 00,
                                 originalTitle: "Terminator",
                                 title: "Terminator",
                                 overview: "Un cyborg ha sido enviado desde el futuro en una misión mortal: eliminar a Sarah Connor, una joven cuya vida tendrá una gran importancia en los próximos años. Sarah tiene sólo un protector —Kyle Reese— también enviado desde el futuro. El Terminator utiliza su inteligencia excepcional y fuerza para encontrar a Sarah, pero ¿hay alguna forma de detener al cyborg aparentemente indestructible?", 
                                 releaseDate: Date.now,
                                 voteAverage: 9.3,
                                 posterPath: "https://image.tmdb.org/t/p/w500/kbPqRWsGS1siVUeEFVtLKloTG0Y.jpg")
}

extension CastMember {
    static let testCastMember = CastMember(id: 0, 
                                           name: "Arnold Schwarzenegger",
                                           profilePath: "/zEMhugsgXIpnQqO31GpAJYMUZZ1.jpg",
                                           character: "The terminator")
}

struct testMovieLocal: MovieInteractorProtocol {
    var urlTest = Bundle.main.url(forResource: "testMovie", withExtension: "json")!
    
    func getMovies(page: Int) async throws -> [Movie] {
        print("Llamo a local")
        let data = try Data(contentsOf: urlTest)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.dateFormatCustom)
        return try decoder.decode(MoviesResultDTO.self, from: data).results.map(\.toPresentation)
    }
}
    
struct testCastMember: CastMemberInteractorProtocol {
    func getMovieTrailer(movieID: Int) async throws -> [MovieVideoPresentation] {
        []
    }
    
    var urlTest = Bundle.main.url(forResource: "TestCast", withExtension: "json")!
    
    func getCast(id: Int) async throws -> [CastMember] {
        let data = try Data(contentsOf: urlTest)
        return try JSONDecoder().decode(CastCrewDTO.self, from: data).cast.map(\.toSecondoPresentation)
    }
}

extension MoviesVM {
    static let localTestMovie = MoviesVM(moviesInteractor: testMovieLocal())
}

extension MoviesDetailVM {
    static let localTestCastMember = MoviesDetailVM(castMemberInteractor: testCastMember(), selectedMovie: .testMovie)
}
