//
//  Course.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/8/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import Foundation
import MapKit

struct TopLevelDict: Codable {
    
    let businesses: [Courses]
}

struct Courses: Codable {
    
    let name: String
//    let longitude: Double
//    let latitude: Double
    let coordinates: [Coordinates]
    let distance: Double
}

struct Coordinates: Codable {
    
    let longitude: Double
    let latitude: Double
}


