//
//  JSONParser.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/15/23.
//

import Foundation

class JSONParser {
    
    // Fetches job listings from the server
    static func fetchJobListings(completion: @escaping ([JobListing]?) -> Void) {
        let urlString = "http://uwcyber.net:4000/getJobNodes" // replace with your Flask server URL
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching data:", error ?? "Unknown error")
                completion(nil)
                return
            }
            
            print("\n\n", String(data: data, encoding: .utf8) ?? "Invalid data" + "\n\n")

            print("\n\n", [JobListing].self, "\n\n")
            
            do {
                let jobListings = try JSONDecoder().decode([JobListing].self, from: data)
                completion(jobListings)
            } catch {
                print("Error decoding job listings:", error)
                completion(nil)
            }
        }
        
        task.resume()
    }
}
