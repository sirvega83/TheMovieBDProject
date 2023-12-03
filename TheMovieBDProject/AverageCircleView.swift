//
//  AverageCircleView.swift
//  TheMovieDBProject
//
//  Created by Said Vega Ibn Rouhou on 28/11/23.
//

import SwiftUI



struct AverageCircleView: View {
    
    let movie: Movie
    
    var size = true
    
    @State var progress: Bool = false
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: progress ? movie.averageMovieRate : 0)
            .stroke(style: StrokeStyle(lineWidth: size ? 7 : 3, lineCap: .round))
            .rotation(.degrees(-90))
            .foregroundStyle(.blue)
            .animation(.easeInOut(duration: 2), value: progress) //Le da animación al circulo
            .frame(width: size ? 100 : 30, height: size ? 100 : 30)
            .background {
                Text("\(movie.averageMovie)")
                    .font(size ? .largeTitle : .caption)
                    .bold()
                    .foregroundStyle(.black)
            }
            .background {
                Circle()
                    .fill(.gray)
            }
            .offset(x: 10, y: 10)
            .onAppear { //Cambia a true al mostrar la vista
                progress = true
            }
    }
}

#Preview {
    AverageCircleView(movie: .testMovie)
}
