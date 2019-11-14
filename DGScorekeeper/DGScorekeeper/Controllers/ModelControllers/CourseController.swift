//
//  CourseController.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/8/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import Foundation
import MapKit

class CourseController {
    
    // let url = URL(string: "https://api.yelp.com/v3/businesses/search?term=discgolf&latitude=\(latitude)&longitude=\(longitude)")
    // https://api.yelp.com/v3/businesses/search?term=discgolf&latitude=37.786882&longitude=-122.399972
    
    static let apiKey = "Basic tI_c4fA3AHN2fViDlwPBmdRY3dAz2HuzxhHe7hK7U9w6WxXZ7hWgpQDoVWFE9UwcVNSItKt5gmXtfdhuv76jbKZHYuv3qLJ-GIOd74XBE04SkuVuacFw-6G_oD7DXXYx"
    static let baseURL = "https://api.yelp.com/v3/businesses/search"
    
    static func fetchYeplBusiness(searchTerm: String, completion: @escaping ([Courses]) -> Void) {
        
        guard let url = URL(string: baseURL) else { completion([]); return }
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            else {
                print("The URL is not working correctly")
                completion([])
                return
        }
        
        
        let searchQuery = URLQueryItem(name: "term", value: searchTerm)
        let latitudeQuery = URLQueryItem(name: "latitude", value: "\(40.387878)") // PLACEHOLDER
        let longitudeQuery = URLQueryItem(name: "longitude", value: "\(-111.849167)") // PLACEHOLDER
        components.queryItems = [searchQuery, latitudeQuery, longitudeQuery]
        
        guard let finalURL = components.url else {
            print("The query items are causing issues")
            completion([])
            return
        }
        
        var request = URLRequest(url: finalURL)
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")
        print(request.url?.absoluteURL ?? "Nope")
        
        print(finalURL)
        
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion([])
                return
            }
            
            guard let data = data else { completion([]); return }
            
            do {
                let jsonDecoder = try JSONDecoder().decode(TopLevelDict.self, from: data)
                completion(jsonDecoder.businesses)
            } catch {
                completion([])
            }
        }
        dataTask.resume()
    }
}
