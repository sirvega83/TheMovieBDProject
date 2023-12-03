//
//  MoviesMainView.swift
//  TheMovieDBProject
//
//  Created by Said Vega Ibn Rouhou on 27/11/23.
//

import SwiftUI

struct MoviesMainView: View {
    @ObservedObject var moviesVM = MoviesVM()
    
    
    var body: some View {
        switch moviesVM.viewState {
        case .loading:
            ProgressView()
                .controlSize(.extraLarge)
        case .loaded:
            MoviesListView(moviesVM: moviesVM)
        case .error:
            CustomAlertView(title: "Error de carga",
                            message: "Fallo al sincronizar películas",
                            buttonText: "Intentar de nuevo") {
                Task { await moviesVM.getMovies()}
            }
        }
    }
}

#Preview {
    MoviesMainView(moviesVM: .localTestMovie)
}
