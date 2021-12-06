//
//  EmptyStateView.swift
//  Location Search
//
//  Created by Gustavo Leguizamon on 12/6/21.
//

import SwiftUI

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

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
