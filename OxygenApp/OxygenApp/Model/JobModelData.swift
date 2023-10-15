//
//  LandmarkModelData.swift
//  OxygenApp
//
//  Created by Benjamin Price on 10/14/23.
//

import Foundation

class JobModelData: ObservableObject {
    @Published var jobListings: [JobListing] = []
    
    init() {
        fetchJobListings(latitude: 47.6, longitude: -122.3)
    }
    
    func fetchJobListings(latitude: Double, longitude: Double) {
        let url = URL(string: "http://uwcyber.net:4000/getJobNodes")!
        
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let bodyData = "latitude=\(latitude)&longitude=\(longitude)"
        request.httpBody = bodyData.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching data:", error ?? "Unknown error")
                return
            }
            
            print(String(data: data, encoding: .utf8) ?? "Invalid data")
            
            do {
                let jobListingsResponse = try JSONDecoder().decode([JobListing].self, from: data)
                DispatchQueue.main.async {
                    self.jobListings = jobListingsResponse
                }
            } catch {
                print("Decoding failed: \(error.localizedDescription)")
                if let decodingError = error as? DecodingError {
                    print("DecodingError: \(decodingError)")
                    switch decodingError {
                    case .typeMismatch(let type, let context):
                        print("Type Mismatch: \(type) - \(context.debugDescription)")
                    case .valueNotFound(let type, let context):
                        print("Value Not Found: \(type) - \(context.debugDescription)")
                    case .keyNotFound(let key, let context):
                        print("Key Not Found: \(key) - \(context.debugDescription)")
                    case .dataCorrupted(let context):
                        print("Data Corrupted: \(context.debugDescription)")
                    @unknown default:
                        break
                    }
                }
            }
        }
        
        task.resume()
    }
    
    @available(*, deprecated, message: "Use loadJobListings() for seperated job and course databases")
    func fetchCombinedDataJobListings() {
        // Set up parameters
        let parameters: [String: Any] = [
            "latitude": 47,
            "longitude": 122
        ]
        
        // Serialize the parameters into JSON data
        guard let postData = try? JSONSerialization.data(withJSONObject: parameters) else {
            print("Error: Unable to serialize parameters")
            return
        }
        
        // Set up the URLRequest
        var request = URLRequest(url: URL(string: "http://uwcyber.net:4000/getJobNodes")!)
        request.httpMethod = "POST"
        request.httpBody = postData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Perform the request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching data:", error ?? "Unknown error")
                return
            }
            
            do {
                let jobListingsResponse = try JSONDecoder().decode([JobListing].self, from: data)
                DispatchQueue.main.async {
                    self.jobListings = jobListingsResponse
                }
            } catch {
                print("Error decoding data:", error)
            }
        }
        
        task.resume()
    }
}

// The dummy data function remains unchanged
// You can still use this for testing if needed
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
