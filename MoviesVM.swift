//
//  MoviesVM.swift
//  TheMovieBDProject
//
//  Created by Said Vega Ibn Rouhou on 24/11/23.
//

import Foundation

enum ViewState {
    case loading
    case loaded
    case error
}

final class MoviesVM: ObservableObject {
    
    @Published var viewState: ViewState = .loading
    
    let moviesInteractor : MovieInteractorProtocol
    
    var page = 1
    
    @Published var movies: [Movie] = []
    
    init(moviesInteractor: MovieInteractorProtocol = MovieInteractor()) {
        self.moviesInteractor = moviesInteractor
        Task { await getMovies() }
    }

    func getMovies() async {
        do {
            print("Llamada de red")
            let movs = try await moviesInteractor.getMovies(page: page)
            
            //para que se haga en el hilo principal se crea:
            
            await MainActor.run {
                movies += movs
                //sleep(5)
                viewState = .loaded //Para que cambien estado al cargar las peliculas
            }
        } catch {
            await MainActor.run {
                viewState = .error
                print("Llamada de red")
            }
        }
    }
    
    func loadNextPage(movie: Movie) {
        if isLastItem(movie: movie) {
            page += 1
            print("Cargo siguiente página")
            Task { await getMovies() }
        }
    }
    
    func isLastItem(movie: Movie) -> Bool {
        movies.last?.id == movie.id
    }
}
