//
//  LocationViewModel.swift
//  Location Search
//
//  Created by Gustavo Leguizamon on 12/6/21.
//

import Foundation

class LocationViewModel: Identifiable, ObservableObject {
    let location: LocationDTO
    
    private let apiClient: Client
  
    init(apiClient: Client = APIClient(), location: LocationDTO) {
        self.location = location
        self.apiClient = apiClient
    }
}
