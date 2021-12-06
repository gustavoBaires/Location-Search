//
//  ContentView.swift
//  Location Search
//
//  Created by Gustavo Leguizamon on 12/6/21.
//

import SwiftUI

struct ContentView: View {
    
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
        ContentView(viewModel: LocationListViewModel())
    }
}

struct LocationView: View {
    @ObservedObject var viewModel: LocationViewModel

    var body: some View {
        HStack {
            Text(viewModel.location.name)
                .padding()
            Spacer()
            Button {
                viewModel.saveLocation(location: viewModel.location)
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .font(.largeTitle)
            }
            .padding()
        }
        .padding()
    }
}

struct EmptyStateView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "mappin")
                .font(.system(size: 85))
                .padding(.bottom)
            Text("Start searching some location...")
                .font(.body)
            Spacer()
        }
        .padding()
    }
}






