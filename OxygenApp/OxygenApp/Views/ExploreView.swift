//
//  ExploreView.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Jobs Near You")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("Save lives. Make rent.")
                .font(.subheadline)
            
            MapView()
                .frame(height: 300)
                .cornerRadius(20)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ExploreView()
}
