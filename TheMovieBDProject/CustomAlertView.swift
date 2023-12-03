//
//  CustomAlertView.swift
//  TheMovieDBProject
//
//  Created by Said Vega Ibn Rouhou on 27/11/23.
//

import SwiftUI

struct CustomAlertView: View {
    let title: String
    let message: String
    let buttonText: String
    
    let action: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .foregroundStyle(.red.opacity(0.8))
            
            Text(title)
                .font(.body)
                .bold()
            Text(message)
                .font(.body)
                .bold()
            
            Button(action: {
                action()
            }, label: {
                Text("buttonText")
            })
            .buttonStyle(.bordered)
        }
        .frame(maxWidth: 250, maxHeight: 300)
        .padding(15)
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CustomAlertView(title: "Error", message: "Mensaje de error,Mensaje de error,Mensaje de error,Mensaje de error,Mensaje de error,Mensaje de error,Mensaje de error", buttonText: "Hago algo", action: {})
}
