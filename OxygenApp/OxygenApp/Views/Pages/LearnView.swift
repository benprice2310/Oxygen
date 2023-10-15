//
//  LearnView.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/15/23.
//

import SwiftUI

struct LearnView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            //                ExploreFilterBarView()
            //                    .padding(.top, 2)
            
            // TODO: Build COURSE CARD DECK
            JobCardDeck()
                .padding(.horizontal, -20)
        }
        .padding(.horizontal)
        .navigationTitle("Courses Available")
        .toolbarTitleDisplayMode(.automatic)
    }
}

#Preview {
    LearnView()
}
