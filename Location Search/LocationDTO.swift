//
//  LocationDTO.swift
//  Location Search
//
//  Created by Gustavo Leguizamon on 12/6/21.
//

import Foundation

struct LocationDTO: Codable {
    let id: String
    let name: String
    let latitude: String
    let longitude: String
    
    enum CodingKeys: String, CodingKey {
        case id = "place_id"
        case name = "display_name"
        case latitude = "lat"
        case longitude = "lon"
    }
}
