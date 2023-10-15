//
//  HomeView.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var jobData = JobModelData()
//    let jobData: Root = JSONParser.load("dummy_job_data.json")
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text("Oxygen")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("O2")
                    .font(.subheadline)
            }
            Text("A breath of fresh air")
                .font(.subheadline)
            
//            Image("ocean")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .cornerRadius(10)
//                .padding(40)
            
            Spacer()
            
            JobCardDeck()
                .padding(.horizontal, -20)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
