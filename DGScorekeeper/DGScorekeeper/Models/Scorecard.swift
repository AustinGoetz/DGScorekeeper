//
//  Scorecard.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/7/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import Foundation

class Scorecard: Codable {
    
    var totalScore: String
    let roundDate: Date
    var courseName: String
    
    init(totalScore: String, roundDate: Date = Date(), courseName: String) {
        self.totalScore = totalScore
        self.roundDate = roundDate
        self.courseName = courseName
    }
}

extension Scorecard: Equatable {
    static func == (lhs: Scorecard, rhs: Scorecard) -> Bool {
        return lhs.totalScore == rhs.totalScore && lhs.roundDate == rhs.roundDate && lhs.courseName == rhs.courseName
    }
}
