//
//  JSONParser.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import Foundation

class JSONParser {
    static func parse(data: Data) -> Root? {
        let decoder = JSONDecoder()
        do {
            let root = try decoder.decode(Root.self, from: data)
            return root
        } catch {
            print("Error parsing JSON: \(error)")
            return nil
        }
    }
    
    static func extractJobsAndCourses(from jsonData: Data) -> (jobs: [Job], courses: [Course])? {
        if let root = JSONParser.parse(data: jsonData) {
            return (root.jobs, root.courses)
        }
        return nil
    }
    
    static func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error decoding \(filename): \(error)")
            if let error = error as? DecodingError {
                switch error {
                case .typeMismatch(let type, let context):
                    print("Type Mismatch: \(type) - \(context.debugDescription)")
                case .valueNotFound(let type, let context):
                    print("Value Not Found: \(type) - \(context.debugDescription)")
                case .keyNotFound(let key, let context):
                    print("Key Not Found: \(key) - \(context.debugDescription)")
                case .dataCorrupted(let context):
                    print("Data Corrupted: \(context.debugDescription)")
                default:
                    break
                }
            }
            fatalError("Couldn't parse \(filename)")
        }
    }
}
