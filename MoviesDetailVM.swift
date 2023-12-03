//
//  CastMemberVM.swift
//  TheMovieDBProject
//
//  Created by Said Vega Ibn Rouhou on 28/11/23.
//

import SwiftUI

final class MoviesDetailVM: ObservableObject {
    
    let castMemberInteractor: CastMemberInteractorProtocol
    let selectedMovie: Movie
    
    @Published var castMember: [CastMember] = []
    
    @Published var movieTrailer: [MovieVideoPresentation] = []
    
    //Filtra los 15 primeros elementos de un array
    var filteredCastCrew: ArraySlice<CastMember> {
        castMember.prefix(15)
    }
    
    var trailerFilter: String? {
        movieTrailer.filter { $0.official == true && $0.type == .trailer }.first?.key
    }
    
    init(castMemberInteractor: CastMemberInteractorProtocol = CastMemberInteractor(), selectedMovie: Movie ) {
        self.castMemberInteractor = castMemberInteractor
        self.selectedMovie = selectedMovie
        Task {
            await getCastMember(id: selectedMovie.id)
            await getTrailerMovie(id: selectedMovie.id)
        }
        
    }
    
    func getCastMember(id: Int) async {
        do {
            let cs = try await castMemberInteractor.getCast(id: id )
            await MainActor.run {
                castMember = cs
            }
        } catch {
            print(error) 
        }
    }
    
    func getTrailerMovie(id: Int) async {
        do{
            let tr = try await castMemberInteractor.getMovieTrailer(movieID: id)
            await MainActor.run {
                movieTrailer = tr
            }
        } catch {
            print(error)
        }
    }
  
}

