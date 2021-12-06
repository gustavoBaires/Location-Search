//
//  Location_SearchApp.swift
//  Location Search
//
//  Created by Gustavo Leguizamon on 12/6/21.
//

import SwiftUI

@main
struct Location_SearchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: LocationListViewModel())
        }
    }
}
