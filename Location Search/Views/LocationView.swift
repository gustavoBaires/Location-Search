//
//  LocationView.swift
//  Location Search
//
//  Created by Gustavo Leguizamon on 12/6/21.
//

import SwiftUI

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
struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(viewModel: LocationViewModel(location: LocationDTO(id: "", name: "", latitude: "", longitude: "")))
    }
}
