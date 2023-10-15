//
//  JobListing.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

//
//  JobListing.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct JobListing: Hashable, Codable {
    var listing_id: String
    var organization_id: String
    var job_title: String
    var description: String
    var diversity_badge: Bool
    var hours: Array<String>
    var pay: Array<String> // TODO: decide how to handle this, maybe new object
    var certification: String // TODO: would like to make certification objects for uniformity
    var address: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
