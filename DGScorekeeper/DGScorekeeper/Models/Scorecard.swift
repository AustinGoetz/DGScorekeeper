//
//  Scorecard.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/7/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import Foundation

class Scorecard {
    
    var totalScore: String
    let scoreToPar: String
    let roundDate: Date
    var courseName: String
    
    init(totalScore: String, scoreToPar: String, roundDate: Date = Date(), courseName: String) {
        self.totalScore = totalScore
        self.scoreToPar = scoreToPar
        self.roundDate = roundDate
        self.courseName = courseName
    }
}
