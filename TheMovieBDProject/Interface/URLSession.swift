//
//  URLSession.swift
//  TheMovieBDProject
//
//  Created by Said Vega Ibn Rouhou on 23/11/23.
//

import Foundation
//Se encarga de mandar las peticiones a la red

extension URLSession {
    func getDataCustom(for url: URLRequest) async throws -> (Data, HTTPURLResponse) {
        do {
            let (data, response) = try await URLSession.shared.data(for: url)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.noHTTP}
            return (data, response)
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.general(error)
        }
    }
}

