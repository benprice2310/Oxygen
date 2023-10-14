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
            
            MapView()
                .tabItem { Label("Map", systemImage: "map") }
            
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gear") }
        }
    }
    
    
    struct HomeView: View {
        var body: some View {
            VStack(alignment: .leading) {
                Text("Oxygen")
                    .font(.title)
                HStack {
                    Text("A breath of fresh air")
                        .font(.subheadline)
                    Spacer()
                    Text("O2")
                        .font(.subheadline)
                }
            }
            .padding()
        }
    }
    
    struct MapView: View {
        var body: some View {
            VStack(alignment: .leading) {
                Text("Jobs Near You")
                    .font(.title)
                Text("Save lives. Make rent.")
                    .font(.subheadline)
                
                MapBoard()
                    .frame(height: 300)
            }
            .padding()
        }
    }
    
    struct SettingsView: View {
        var body: some View {
            Text("Settings")
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
