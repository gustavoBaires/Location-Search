//
//  LocationDetailViewModel.swift
//  Location Search
//
//  Created by Gustavo Leguizamon on 12/6/21.
//

import Foundation

class LocationDetailViewModel: ObservableObject {
    let location: LocationDTO
    
    private let apiClient: Client
  
    init(apiClient: Client = APIClient(), location: LocationDTO) {
        self.location = location
        self.apiClient = apiClient
    }
    
    public func saveLocation(location: LocationDTO, completionHandler: @escaping(LocationDTO?)-> Void) {
        apiClient.saveLocations(location: location) { location in
            guard let location = location else {
                completionHandler(nil)
                return
            }
            completionHandler(location)
        }
    }
}
