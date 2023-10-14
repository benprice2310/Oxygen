//
//  SettingsView.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Settings")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            HStack {
                Text("Change what you want")
                    .font(.subheadline)
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
