//
//  JobCard.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import SwiftUI

struct JobCardView: View {
    let job: JobListing
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // Organization and Job Title
            VStack(alignment: .leading, spacing: 5) {
                HStack() {
                    Text(job.organization)
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    // Diversity badge as light blue icon
                    if job.diversity_badge {
                        Image("diversityIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .background(Color.blue.opacity(0.2))
                            .clipShape(Circle())
                    }
                }
                
                Text(job.job_title)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 5)
            
            Divider()
                .padding(.vertical, 5)
            
            // Description with a see more option
            Text(job.description)
                .font(.caption)
                .lineLimit(2)
                .padding(.bottom, 5)
            
            // Working hours as tags
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(job.hours, id: \.self) { hour in
                        Text(hour)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.blue.opacity(0.6))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
        .padding(.horizontal)
    }
}

struct JobCardView_Preview: PreviewProvider {
    static var previews: some View {
        let sampleJob = JobListing(listing_id: "Pbjs3coJkV", organization_id: "swedishhospital69", organization: "Swedish Hospital", job_title: "Certified Nurse Assistant", description: "About Swedish Hospital: Swedish Hospital is a leading...", diversity_badge: true, hours: ["Full-Time", "Part-Time"], pay: [.hourly, .amount(25)], certification: "Certified Nursing Assistant Certification", address: "747 Broadway, Seattle, WA 98122", coordinates: Coordinates(lat: "47.609379", long: "-122.320892"))
        JobCardView(job: sampleJob)
    }
}

#Preview {
    JobCardView_Preview.previews
}
