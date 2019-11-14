//
//  Course.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/8/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import Foundation

struct TopLevelDict: Decodable {
    
    let businesses: [Courses]
}

struct Courses: Decodable {
    
    let name: String
}

