//
//  ContentView.swift
//  Location Search
//
//  Created by Gustavo Leguizamon on 12/6/21.
//

import SwiftUI

struct LocationListView: View {
    
    @ObservedObject var viewModel: LocationListViewModel
            
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("e.g. Empire State", text: $viewModel.searchQuery)
                        .padding()
                    Spacer()
                    Button("Search") {
                        UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
                    }
                }
                .padding()
                
                if viewModel.locations.isEmpty {
                    EmptyStateView()
                } else {
                    List(viewModel.locations) { location in
                        LocationView(viewModel: location)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Location Search")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView(viewModel: LocationListViewModel())
    }
}
