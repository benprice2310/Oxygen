//
//  ProfileCircleImage.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import SwiftUI

struct ProfileCircleImage: View {
    var body: some View {
        Image("profile_picture")
            .resizable()
            .frame(width: 70, height: 70, alignment: .topLeading)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 2)
            }
            .shadow(radius: 7)
    }
}


#Preview {
    ProfileCircleImage()
}
