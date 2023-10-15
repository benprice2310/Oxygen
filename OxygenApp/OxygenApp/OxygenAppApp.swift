//
//  OxygenAppApp.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import SwiftUI
import SwiftData

@main
struct OxygenAppApp: App {
    @StateObject private var locationManager = LocationManager()

    var sharedModelContainer: ModelContainer = {

        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear() {
                    locationManager.requestPermission()
                }
        }
        .modelContainer(sharedModelContainer)
    }
}
