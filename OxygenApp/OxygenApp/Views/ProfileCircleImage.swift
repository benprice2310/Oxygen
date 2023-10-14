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
            .aspectRatio(contentMode: .fit)
            .frame(width: 96, height: 96, alignment: .center)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 3)
            }
            .shadow(radius: 7)
    }
}


#Preview {
    ProfileCircleImage()
}
