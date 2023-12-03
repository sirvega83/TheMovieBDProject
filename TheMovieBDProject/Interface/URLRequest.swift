//
//  URLRequest.swift
//  TheMovieBDProject
//
//  Created by Said Vega Ibn Rouhou on 23/11/23.
//

import Foundation
//Mi petición a la red

extension URLRequest {
    static func getCustom(url: URL) -> URLRequest {
        var request = URLRequest(url: url) //serializamos URLRequest
        request.timeoutInterval = 30 //Por defecto siempre son 60
        request.httpMethod = "GET"
        request.setValue("aplication/json", forHTTPHeaderField: "Accept")
        request.setValue(String(data: Data(AK), encoding: .utf8)!, forHTTPHeaderField: "Authorization")
        return request
    }
    
    static func getPaginatedMovies(url: URL, page: Int = 1) -> URLRequest {
        var request = URLRequest(url: url)
        request.url?.append(queryItems: [URLQueryItem(name: "page", value: "\(page)")])
        request.timeoutInterval = 30 //Por defecto siempre son 60
        request.httpMethod = "GET"
        request.setValue("aplication/json", forHTTPHeaderField: "Accept")
        request.setValue(String(data: Data(AK), encoding: .utf8)!, forHTTPHeaderField: "Authorization")
        return request
    }
}
