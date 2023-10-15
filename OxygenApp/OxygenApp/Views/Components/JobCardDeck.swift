//
//  JobCardDeck.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import SwiftUI

struct JobCardDeck: View {
    @ObservedObject var jobListingData = JobModelData()  // this assumes you have JobModelData class set up properly
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ForEach(jobListingData.jobListings) { job in
                    JobCardView(job: job)
                        .padding(.vertical, 5)
                }
            }
            .padding()
        }
    }
}

struct JobCardDeck_Previews: PreviewProvider {
    static var previews: some View {
        JobCardDeck()
    }
}

#Preview {
    JobCardDeck_Previews.previews
}
