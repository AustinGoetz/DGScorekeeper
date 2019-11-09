//
//  Course.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/8/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import Foundation
import MapKit

class TopLevelDict {
    
    let businesses: [Courses]
    
    init(businesses: [Courses]) {
        self.businesses = businesses
    }
}

class Courses {
    
    let name: String
    let coordinates: CLLocationCoordinate2D
    let distance: Double
    
    init(name: String, coordinates: CLLocationCoordinate2D, distance: Double) {
        self.name = name
        self.coordinates = coordinates
        self.distance = distance
    }
}


