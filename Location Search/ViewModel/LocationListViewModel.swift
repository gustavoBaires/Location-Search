//
//  LocationListViewModel.swift
//  Location Search
//
//  Created by Gustavo Leguizamon on 12/6/21.
//

import Foundation
import Combine

class LocationListViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published public private(set) var locations: [LocationViewModel] = []

    private let apiClient: Client
    private var disposables = Set<AnyCancellable>()

    init(apiClient: Client = APIClient()) {
        self.apiClient = apiClient
        $searchQuery
            .sink(receiveValue: loadLocations(searchQuery:))
            .store(in: &disposables)
    }

    private func loadLocations(searchQuery: String) {
        locations.removeAll()

        apiClient.loadLocations(searchQuery: searchQuery) { locations in
            locations.forEach { self.appendLocation(location: $0) }
        }
    }

    private func appendLocation(location: LocationDTO) {
        let locationViewModel = LocationViewModel(location: location)
        DispatchQueue.main.async {
            self.locations.append(locationViewModel)
        }
    }
}


