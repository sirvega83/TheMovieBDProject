//
//  MoviesListView.swift
//  TheMovieBDProject
//
//  Created by Said Vega Ibn Rouhou on 24/11/23.
//

import SwiftUI

struct MoviesListView: View {
    @ObservedObject var moviesVM: MoviesVM
    
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(moviesVM.movies) { movie in
                    NavigationLink(value: movie){
                        MoviesCellView(movie: movie)
                            .onAppear {
                                moviesVM.loadNextPage(movie: movie)
                            }
                    }
                }
            }
            .navigationTitle("THE MOVIE DB")
            .navigationDestination(for: Movie.self) { movie in
                MoviesDetailView(moviesDetailVM: MoviesDetailVM(selectedMovie: movie))
            }
        }
    }
}

#Preview {
    MoviesListView(moviesVM: .localTestMovie)
}

//Botón con enlace a la película -> Link
//Link al enlace
//Boton de compartir -> shareLink
