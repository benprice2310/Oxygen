//
//  MapView.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import SwiftUI
import MapKit


struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var showsUserLocation: Bool = true
    
    var body: some View {
        Map(coordinateRegion: $region,
            showsUserLocation: showsUserLocation, userTrackingMode: $userTrackingMode
        )
        .onAppear {
            // You can add any additional setup here if needed
        }
        .mapControls {
            MapUserLocationButton()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

#Preview {
    MapView()
}
