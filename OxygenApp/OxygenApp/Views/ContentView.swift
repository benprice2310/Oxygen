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
            
            MyProfileView()
                .tabItem { Label("Profile", systemImage: "person" )}
            
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gear") }
        }
    }
    
    
    struct HomeView: View {
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
            }
            .padding()
        }
    }
    
    struct MapView: View {
        var body: some View {
            VStack(alignment: .leading) {
                Text("Jobs Near You")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Save lives. Make rent.")
                    .font(.subheadline)
                
                MapBoard()
                    .frame(height: 300)
                    .cornerRadius(50)
            }
            .padding()
        }
    }
    
    
    struct MyProfileView: View {
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text("My Profile")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    
                    ProfileCircleImage()
                }
            }
            .padding()
        }
    }
    
    struct SettingsView: View {
        var body: some View {
            VStack(alignment: .leading) {
                Text("Settings")
                    .font(.title)
                HStack {
                    Text("Change what you want")
                        .font(.subheadline)
                    Spacer()
                }
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
