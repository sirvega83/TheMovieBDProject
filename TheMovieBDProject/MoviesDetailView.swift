//
//  MoviesDetailView.swift
//  TheMovieDBProject
//
//  Created by Said Vega Ibn Rouhou on 26/11/23.
//

import SwiftUI

struct MoviesDetailView: View {
    @ObservedObject var moviesDetailVM : MoviesDetailVM
    
    @State var showTrailer = false
    
    var body: some View {
        
        ScrollView{
            ZStack{
                VStack{
                    Text(moviesDetailVM.selectedMovie.originalTitle)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: 300, maxHeight: 200)
                        .padding(.bottom, 80)
                    Text(moviesDetailVM.selectedMovie.title)
                    
                    MoviePosterView(movie: moviesDetailVM.selectedMovie, size: .detailPoster)
                    AverageCircleView(movie: moviesDetailVM.selectedMovie)
                }
                .padding(30)
            }
            Link(destination: moviesDetailVM.selectedMovie.movieLink, label: {
                HStack{ //No haría falta poner el HStack, lo infiere
                    Text("Web")
                    Image(systemName: "link")
                }
            })
            
            if let _ = moviesDetailVM.trailerFilter {
                Button(action: {
                    showTrailer.toggle()
                }, label: {
                    Text("Show trailer")
                })
                .buttonStyle(.bordered)
            } else {
                Text("No trailer")
            }
            
            
            
            Text(moviesDetailVM.selectedMovie.overview)
                .multilineTextAlignment(.center)
                .padding(15)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem()], content: {
                    ForEach(moviesDetailVM.filteredCastCrew) { actor in
                        CastMemberCellView(castMember: actor)
                            .padding(7)
                    }
                })
            }
            .scrollIndicators(.hidden)
        }
        .sheet(isPresented: $showTrailer, content: {
            if let trailerFilter = moviesDetailVM.trailerFilter {
                YoutubePlayer(url: .getYoutbueTrailer(key: trailerFilter) )
            }
            
        })
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                ShareLink("Web", item: moviesDetailVM.selectedMovie.movieLink)
            }
        }
    }
}


#Preview {
    NavigationStack{
        MoviesDetailView(moviesDetailVM: .localTestCastMember)
    }
}

//Arreglar celda
//Añadir debajo un enlace "ver más" y abra la wickipedia del actor
//Paginación
