//
//  HomeView.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import SwiftUI

struct HomeView: View {
    let jobData: Root = JSONParser.load("dummy_job_data.json")
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Oxygen")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            HStack {
                Text("A breath of fresh air")
                    .font(.subheadline)
                Spacer()
                Text("O2")
                    .font(.subheadline)
            }
            
            Image(information.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)
            
            
            JobCardDeck(jobs: jobData.jobs)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
