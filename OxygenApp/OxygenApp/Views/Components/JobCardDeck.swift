//
//  JobCardDeck.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import SwiftUI

struct JobCardDeck: View {
    let jobs: [Job]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(jobs, id: \.listing_id) { job in
                    JobCard(job: job)
                }
            }
        }
    }
}

struct JobCardDeck_Previews: PreviewProvider {
    static var previews: some View {
        let sampleJob1 = Job(listing_id: "Pbjs3coJkV", organization_id: "swedishhospital69", organization: "Swedish Hospital", job_title: "Certified Nurse Assistant", description: "About Swedish Hospital: Swedish Hospital is a leading...", diversity_badge: true, hours: ["Full-Time", "Part-Time"], pay: [.hourly, .amount(25)], certification: "Certified Nursing Assistant Certification", address: "747 Broadway, Seattle, WA 98122", coordinates: Coordinates(lat: "47.609379", long: "-122.320892"))
        
        let sampleJob2 = Job(
            listing_id: "A1b2c3D4e5",
            organization_id: "techinnovators123",
            organization: "Tech Innovators Inc.",
            job_title: "Junior Software Developer",
            description: """
        About Tech Innovators Inc.:
        Tech Innovators is a cutting-edge technology firm specializing in developing next-generation applications. With a vibrant team and a culture of innovation, we're pushing the boundaries of what's possible in software.
        Position Overview:
        We are seeking budding software developers who are passionate about coding and building world-class applications. As a Junior Developer, you'll be part of a dynamic team and work on exciting projects that use the latest tech stacks.
        Key Responsibilities:
        - Collaborate with the team to design and develop software solutions.
        - Write efficient, maintainable code.
        - Debug and resolve software defects.
        - Participate in code reviews.
        - Stay updated with the latest in software development.
        Qualifications:
        - Bachelor's degree in Computer Science or related field.
        - Familiarity with any programming language (Java, Python, Swift, etc.).
        - Strong analytical and problem-solving skills.
        - Eagerness to learn and grow in the tech field.
        Benefits:
        - Competitive salary and benefits.
        - Work with a talented and supportive team.
        - Regular training sessions and workshops.
        - Opportunities for career growth.
    
        Tech Innovators is an equal opportunity employer. We value diversity and foster an inclusive work environment.
    """,
            diversity_badge: true,
            hours: ["Full-Time"],
            pay: [.hourly, .amount(55000), .amount(65000)],
            certification: "None required, but relevant certifications are a plus.",
            address: "123 Tech Park,\nSilicon Valley, CA 95054",
            coordinates: Coordinates(lat: "37.404319", long: "-122.074890")
        )
        
        let sampleJob3 = Job(
            listing_id: "Z9y8x7W6v5",
            organization_id: "designmasters456",
            organization: "Design Masters Studio",
            job_title: "Graphic Designer",
            description: """
        About Design Masters Studio:
        Design Masters is an award-winning creative agency based in the heart of the city. We pride ourselves on turning visions into visuals and making brands come alive through design.
        Position Overview:
        We are on the lookout for an enthusiastic Graphic Designer with a keen eye for detail. You'll be crafting visual assets that resonate, tell a story, and make an impact.
        Key Responsibilities:
        - Collaborate with the team to understand brand goals and deliver stunning designs.
        - Create visuals for digital platforms, print media, and branding.
        - Ensure consistency in design across various touchpoints.
        - Provide creative input in brainstorming sessions.
        - Stay updated with the latest design trends and techniques.
        Qualifications:
        - Degree in Graphic Design or related field.
        - Proficiency in design software (e.g., Adobe Creative Suite).
        - Strong portfolio showcasing a variety of projects.
        - Ability to work in a fast-paced environment.
        - Great communication skills.
        Benefits:
        - Attractive compensation and benefits.
        - Opportunity to work with big-name clients.
        - Regular team-building events and workshops.
        - Inspiring workspace and design tools.
    
        Design Masters is an equal opportunity employer. We champion creativity from every corner of the globe.
    """,
            diversity_badge: true,
            hours: ["Full-Time"],
            pay: [.salary, .amount(48000), .amount(57000)],
            certification: "Relevant graphic design certifications are a bonus.",
            address: "456 Artistry Avenue,\nCreative City, CA 94102",
            coordinates: Coordinates(lat: "37.773972", long: "-122.431297")
        )
        
        
        
        JobCardDeck(jobs: [sampleJob1, sampleJob2, sampleJob3])
    }
}

#Preview {
    JobCardDeck_Previews.previews
}
