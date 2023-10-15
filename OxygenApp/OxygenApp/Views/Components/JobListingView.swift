//
//  JobListingView.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import SwiftUI

struct JobListingView: View {
    let job: Job
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(job.organization)
                .font(.headline)
            
            Text(job.job_title)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(job.description)
                .font(.footnote)
                .lineLimit(3)
            
            Spacer()
            
            HStack {
                ForEach(job.hours, id: \.self) { hour in
                    Text(hour)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.blue.opacity(0.6))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .padding([.top, .horizontal])
    }
}

struct JobListingView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleJob = Job(listing_id: "Pbjs3coJkV", organization_id: "swedishhospital69", organization: "Swedish Hospital", job_title: "Certified Nurse Assistant", description: "About Swedish Hospital: Swedish Hospital is a leading...", diversity_badge: true, hours: ["Full-Time", "Part-Time"], pay: [.hourly, .amount(25)], certification: "Certified Nursing Assistant Certification", address: "747 Broadway, Seattle, WA 98122", coordinates: Coordinates(lat: "47.609379", long: "-122.320892"))
        JobListingView(job: sampleJob)
    }
}

#Preview {
    JobListingView_Previews.previews
}
