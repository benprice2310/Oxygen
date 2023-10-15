//
//  Model.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import Foundation

struct Root: Codable {
    let jobs: [Job]
    let courses: [Course]
}

struct Job: Codable {
    let listing_id: String
    let organization_id: String
    let organization: String
    let job_title: String
    let description: String
    let diversity_badge: Bool
    let hours: [String]
    let pay: [PayInfo]
    let certification: String
    let address: String
    let coordinates: Coordinates
}

enum PayInfo: Codable {
    case hourly
    case salary
    case amount(Int)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let intValue = try? container.decode(Int.self) {
            self = .amount(intValue)
            return
        }
        if let stringValue = try? container.decode(String.self), stringValue == "hourly" {
            self = .hourly
            return
        }
        if let stringValue = try? container.decode(String.self), stringValue == "salary" {
            self = .salary
            return
        }
        throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Data doesn't match any known case"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .hourly:
            try container.encode("hourly")
        case .salary:
            try container.encode("salary")
        case .amount(let value):
            try container.encode(value)
        }
    }
}


struct Course: Codable {
    let organization_id: String
    let organization: String
    let courses: Courses
    let address: String
    let coordinates: Coordinates
    let urls: [String: String]
}

struct Courses: Codable {
    let names: [String]
}

struct Coordinates: Codable {
    let lat: String
    let long: String
}
