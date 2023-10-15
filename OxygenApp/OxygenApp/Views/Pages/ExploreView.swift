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
                    .fontWeight(.bold)
                Text("Save lives. Make rent.")
                    .font(.subheadline)
                
                MapView()
                    .frame(height: 240)
                    .cornerRadius(20)
                
//                ExploreFilterBarView()
//                    .padding(.top, 2)
                
                JobCardDeck()
                    .padding(.top, -10)
                    .padding(.horizontal, -20)
            }
            .padding()
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
