//
//  MyProfileView.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import SwiftUI

struct MyProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ProfileCircleImage()
                
                Text("My Profile")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    MyProfileView()
}
