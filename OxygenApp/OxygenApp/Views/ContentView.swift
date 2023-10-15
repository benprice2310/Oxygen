//
//  ContentView.swift
//  Oxygen
//
//  Created by Benjamin Price on 10/13/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            
            ExploreView()
                .tabItem { Label("Explore", systemImage: "figure.hiking") }
            
            MyProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
