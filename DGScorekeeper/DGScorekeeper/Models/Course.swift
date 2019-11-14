//
//  Course.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/8/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class TopLevelDict {
    
    let businesses: [Courses]
    
    init(businesses: [Courses]) {
        self.businesses = businesses
    }
}

class Courses {
    
    let name: String
    let longitude: Double
    let latitude: Double
    let coordinates: CLLocationCoordinate2D
    let distance: Double
    
    init(name: String, coordinates: CLLocationCoordinate2D, distance: Double) {
        self.name = name
        self.coordinates = coordinates
        self.distance = distance
    }
    
    //    class Coordinates: Codable {
    //
    //        let longitude: Double
    //        let latitude: Double
    //
    //        init(longitude: Double, latitude: Double) {
    //            self.longitude = longitude
    //            self.latitude = latitude
    //        }
    
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = name
        
        return mapItem
    }
}
}


