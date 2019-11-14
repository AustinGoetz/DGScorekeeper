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
    
    static let apiKey = "Bearer tI_c4fA3AHN2fViDlwPBmdRY3dAz2HuzxhHe7hK7U9w6WxXZ7hWgpQDoVWFE9UwcVNSItKt5gmXtfdhuv76jbKZHYuv3qLJ-GIOd74XBE04SkuVuacFw-6G_oD7DXXYx"
    static let baseURL = "https://api.yelp.com/v3/businesses/search"
    
    static func fetchYelpBusiness(searchTerm: String, completion: @escaping ([Courses]) -> Void) {
        
        guard let url = URL(string: baseURL) else { completion([]); return }
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            else {
                print("The URL is not working correctly")
                completion([])
                return
        }
        
        let searchQuery = URLQueryItem(name: "term", value: "discgolf")
        let latitudeQuery = URLQueryItem(name: "latitude", value: "\(40.760780)") // PLACEHOLDER
        let longitudeQuery = URLQueryItem(name: "longitude", value: "\(-111.891045)") // PLACEHOLDER
        components.queryItems = [searchQuery, latitudeQuery, longitudeQuery]
        
        guard let finalURL = components.url else {
            print("The query items are causing issues")
            completion([])
            return
        }
        
        var request = URLRequest(url: finalURL)
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")
        print(request.url?.absoluteURL ?? "Nope")
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion([])
                return
            }
            
            guard let data = data else { completion([]); print("your data sucks"); return }
            
            do {
                let jsonDecoder = try JSONDecoder().decode(TopLevelDict.self, from: data)
                completion(jsonDecoder.businesses)
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion([])
            }
        }
        .resume()
    }
}
