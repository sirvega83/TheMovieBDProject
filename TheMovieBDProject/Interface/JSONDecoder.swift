//
//  JSONDecoder.swift
//  TheMovieBDProject
//
//  Created by Said Vega Ibn Rouhou on 24/11/23.
//

import Foundation

//Este getJSON es el que hace la llamada a internet

func getJSON<JSON>(request: URLRequest, type: JSON.Type) async throws -> JSON where JSON: Codable{
    let (data, response) = try await URLSession.shared.getDataCustom(for: request)
    
    //Para dar formato a la fecha en SwiftUI
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(.dateFormatCustom)
    
    if response.statusCode == 200 {
        do {
            return try decoder.decode(type.self, from: data)
        } catch {
            throw NetworkError.JSON(error)
        }
    } else {
        throw NetworkError.status(response.statusCode)
    }
}

////func getCastCrewJSON<JSON: Codable>(request: URLRequest, type: JSON.Type) async throws -> JSON {
////    let (data, response) = try await URLSession.shared.data(for: request)
////    guard let response = response as? HTTPURLResponse else { throw NetworkError.noHTTP}
////    if response.statusCode == 200 {
////        do{
////            return try JSONDecoder().decode(type.self, from: data)
////        } catch {
////            throw NetworkError.JSON(error)
////        }
////    } else {
////        throw NetworkError.status(response.statusCode)
////    }
//}


