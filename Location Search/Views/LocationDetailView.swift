//
//  LocationDetailView.swift
//  Location Search
//
//  Created by Gustavo Leguizamon on 12/6/21.
//

import SwiftUI

struct LocationDetailView: View {
    
    @ObservedObject var viewModel: LocationDetailViewModel
    @State private var locationSaved: LocationDTO?
    
    var body: some View {
        VStack {
            Text(viewModel.location.name)
                .padding()
            Text("Latitude: \(viewModel.location.latitude) Longitude: \(viewModel.location.latitude)")
                .padding()
            Spacer()
            Button("Save Location") {
                viewModel.saveLocation(location: viewModel.location) { location in
                    guard let location = location else {
                        return
                    }
                    locationSaved = location
                }
            }
            .padding()
            .alert(item: $locationSaved) { location in
                Alert(title: Text("Important message"), message: Text("\(location.name) is saved."), dismissButton: .default(Text("Ok")))
            }
            Spacer()
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(viewModel: LocationDetailViewModel(location: LocationDTO(id: "", name: "", latitude: "", longitude: "")))
    }
}
