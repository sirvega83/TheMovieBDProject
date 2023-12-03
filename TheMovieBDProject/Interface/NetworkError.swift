//
//  NetworkError.swift
//  TheMovieBDProject
//
//  Created by Said Vega Ibn Rouhou on 23/11/23.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case status(Int)
    case noHTTP
    case general(Error)
    case JSON(Error)
    
    var description: String {
        switch self {
        case .status(let int):
            "El status code es \(int)"
        case .noHTTP:
            "No es llamada HTTP"
        case .general(let error):
            "Error general \(error)"
        case .JSON(let error):
            "Fallo en el JSON \(error)"
        }
    }
}
