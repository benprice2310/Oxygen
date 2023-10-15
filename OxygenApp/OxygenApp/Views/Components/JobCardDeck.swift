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
        NavigationView {
            List(jobListingData.jobListings) { job in
                NavigationLink(destination: JobDetailsView(job: job)) {
                    JobCardView(job: job)
                }
            }
            .navigationBarTitle("Job Listings")
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
