//
//  APIClient.swift
//  LocationDTO Search
//
//  Created by Gustavo Leguizamon on 12/6/21.
//

import Foundation

protocol Client {
    func loadLocations(searchQuery: String, completion: @escaping(([LocationDTO]) -> Void))
    func saveLocations(location: LocationDTO, completion: @escaping((LocationDTO?) -> Void))
}

class APIClient: Client {
    
    private var dataTask: URLSessionDataTask?
    private let API_KEY = "pk.d5d36a5c42c5f38810689864bcb11d10"
    
    func loadLocations(searchQuery: String, completion: @escaping(([LocationDTO]) -> Void)) {
        dataTask?.cancel()
        guard let url = buildUrl(forQuery: searchQuery) else {
            completion([])
            return
        }

        dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion([])
                return
            }
            
            if let locationResponse = try? JSONDecoder().decode([LocationDTO].self, from: data) {
                completion(locationResponse)
            }
        }
        dataTask?.resume()
    }

    func saveLocations(location: LocationDTO, completion: @escaping((LocationDTO?) -> Void)) {
        dataTask?.cancel()
        guard let url = buildUrl(forLocation: location) else {
            completion(nil)
            return
        }

        dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            
            if let locationResponse = try? JSONDecoder().decode(LocationDTO.self, from: data) {
                completion(locationResponse)
            }
        }
        dataTask?.resume()
    }
    
    private func buildUrl(forQuery searchQuery: String) -> URL? {
        guard !searchQuery.isEmpty else { return nil }

        let queryItems = [
            URLQueryItem(name: "key", value: API_KEY),
            URLQueryItem(name: "q", value: searchQuery),
            URLQueryItem(name: "format", value: "json"),
        ]
        var components = URLComponents(string: "https://us1.locationiq.com/v1/search.php")
        components?.queryItems = queryItems

        return components?.url
    }
    
    private func buildUrl(forLocation location: LocationDTO) -> URL? {
        let queryItems = [
            URLQueryItem(name: "key", value: API_KEY),
            URLQueryItem(name: "lat", value: location.latitude),
            URLQueryItem(name: "lon", value: location.longitude),
            URLQueryItem(name: "format", value: "json"),
        ]
        var components = URLComponents(string: "https://us1.locationiq.com/v1/reverse.php")
        components?.queryItems = queryItems

        return components?.url
    }
}

