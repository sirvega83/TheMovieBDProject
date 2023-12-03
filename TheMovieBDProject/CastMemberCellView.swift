//
//  CastMemberCellView.swift
//  TheMovieDBProject
//
//  Created by Said Vega Ibn Rouhou on 29/11/23.
//

import SwiftUI

struct CastMemberCellView: View {
    
    let castMember: CastMember
    
    var body: some View {
        
        
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 150, height: 300)
            .foregroundStyle(Color.white)
            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
            .overlay {
                AsyncImage(url: castMember.imageProfilePath) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .clipShape(.rect(topLeadingRadius: 8, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 8, style: .continuous))
                        .offset(y: -39)
                        .padding()
                } placeholder: {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }
                VStack{
                    Text(castMember.name)
                        .font(.caption)
                        .bold()
                        .foregroundStyle(Color.black)
                    Text(castMember.character)
                        .font(.footnote)
                        .foregroundStyle(Color.black)
                    Link(destination: castMember.wikiURL, label: {
                            Text("Ver más")
                        })
                }
                .offset(y: 120)
                .padding(3)
  
            }
        
            
    }
    
  
    
}

#Preview {
    CastMemberCellView(castMember: .testCastMember)
}
