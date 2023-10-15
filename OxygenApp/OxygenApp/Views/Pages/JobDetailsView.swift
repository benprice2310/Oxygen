//
//  JobDetailsView.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/15/23.
//

import SwiftUI

struct JobDetailsView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            
            
            Image("profile_picture")
                .resizable()
                .frame(width: 200, height: 200, alignment: .topLeading)
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                
                Divider()
                
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            
            
            Spacer()
        }
    }
}

#Preview {
    JobDetailsView()
}
