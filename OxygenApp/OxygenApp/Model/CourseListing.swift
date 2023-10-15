//
//  CourseListing.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct CourseListing: Hashable, Codable {
    var organization_id: String
    var organization: String
    var courses: Array<String>
    var address: String
    
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
    
    // TODO: update to dynamic definition from JSON urls
    struct Urls: Hashable, Codable {
        var website: String
        var programs: String
        var degreePrograms: String
    }
    
}
