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
    
    // https://api.yelp.com/v3/businesses/search?term=discgolf&latitude=37.786882&longitude=-122.399972
    static let apiKey = "tI_c4fA3AHN2fViDlwPBmdRY3dAz2HuzxhHe7hK7U9w6WxXZ7hWgpQDoVWFE9UwcVNSItKt5gmXtfdhuv76jbKZHYuv3qLJ-GIOd74XBE04SkuVuacFw-6G_oD7DXXYx"
    static let baseURL = "https://api.yelp.com/v3/businesses/search?term=discgolf"
    
    static func fetchCourses(at latitude: Double, longitude: Double, completion: @escaping ([Courses]) -> Void) {
        
        guard let url = URL(string: baseURL) else { completion([]); return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
    }
}
