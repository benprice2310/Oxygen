//
//  JobListingRow.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import SwiftUI

struct JobListingRow: View {
    var listing: JobListing
    
    var body: some View {
        HStack{
            listing.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(listing.job_title)
            
            Spacer()
        }
    }
}

#Preview {
    JobListingRow(listing: jobListings[0])
}
