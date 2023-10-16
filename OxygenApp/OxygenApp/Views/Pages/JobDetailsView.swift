//
//  JobDetailsView.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/15/23.
//

import SwiftUI

struct JobDetailsView: View {
    let job: JobListing
    
    // TODO: Convert demo to job.certification
    private let dummy_certifications: [String] = ["CNA", "CPR", "AED"]
    
    var body: some View {
        let imageBGname = job.organization_id + "-bg"
        let imageLogoName = job.organization_id + "-logo"
        
        ScrollView{
            VStack {
                Image(imageBGname)
                    .frame(height: 300)
                    .padding(.top, -80)
                
                
                Image(imageLogoName)
                    .resizable()
//                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .background(Circle().fill(Color.white))
                    .clipShape(Circle())
                    .overlay{
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                
                VStack(alignment: .leading) {
                    Text(job.job_title)
                        .font(.title)
                        .padding(.horizontal, 15)
                    HStack {
                        Text(job.organization)
                        Spacer()
                        Text(job.listing_id)
                    }
                    .padding(.horizontal, 15)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
                    
                    VStack(alignment: .leading)
                    {
                        Text("Requirements")
                            .font(.title3)
                            .padding(.top, 5)
                            .padding(.horizontal, 15)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(dummy_certifications, id: \.self) { cert in
                                    Text(cert)
                                        .padding()
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(8)
                                }
                            }
                        }
                    }
                    
                    Divider()
                    
                    Text("About")
                        .font(.title2)
                        .padding(.bottom, 2)
                    Text(job.description)
                        .lineLimit(200)
                }
                .frame(maxWidth: 350)
                .padding(20)
            }
        }
    }
}

struct JobDetailsView_Preview: PreviewProvider {
    static var previews: some View {
        let sampleJob = JobListing(listing_id: "Pbjs3coJkV", organization_id: "swedishhospital69", organization: "Swedish Hospital", job_title: "Certified Nurse Assistant", description: "About Swedish Hospital: \n Swedish Hospital is a leading healthcare provider committed to delivering world-class patient care in a compassionate environment. Our dedicated team of professionals strives for excellence every day, and we take pride in creating a nurturing workspace for our employees. \n Position Overview: \n We are seeking motivated individuals to join our team as entry-level Certified Nurse Assistants (CNA). This position offers a unique opportunity for individuals looking to start a rewarding career in healthcare without prior experience. \n Key Responsibilities: \n Assist registered nurses and other healthcare professionals in providing basic patient care. \n Monitor and record vital signs including temperature, blood pressure, pulse, and respiratory rate. \n Assist patients with activities of daily living, including bathing, dressing, grooming, and toileting. \n Communicate effectively with patients, families, and staff to ensure a smooth care process. \n Adhere to safety and infection control protocols. \n Maintain a clean and organized work environment. \n Qualifications: \n Valid CNA certification or completion of a state-approved CNA training program. \n Strong interpersonal and communication skills. \n Compassionate and empathetic demeanor. \n Physical stamina to perform the duties of the position. \n Ability to work in a fast-paced environment. \n Benefits: \n Competitive salary and benefits package. \n Comprehensive training and onboarding program. \n Opportunities for professional growth and advancement. \n Supportive work environment. \n\nSwedish Hospital is an equal opportunity employer. We celebrate diversity and are committed to creating an inclusive environment for all employees.", diversity_badge: true, hours: ["Full-Time", "Part-Time"], pay: [.hourly, .amount(25)], certification: "Certified Nursing Assistant Certification", address: "747 Broadway, Seattle, WA 98122", coordinates: Coordinates(latitude: "47.609379", longitude: "-122.320892"))
        JobDetailsView(job: sampleJob)
    }
}

#Preview {
    JobDetailsView_Preview.previews
}
