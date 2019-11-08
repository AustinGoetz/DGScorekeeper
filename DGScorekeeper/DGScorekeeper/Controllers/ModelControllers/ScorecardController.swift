//
//  ScorecardController.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/8/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import Foundation

class ScorecardController {
    
    // MARK: - Shared Instance/Singleton
    static let shared = ScorecardController()
    
    // SoT
    var scorecards: [Scorecard] = []
    
    // MARK: - CRUD
    // Create
    func addScorecard(totalScore: String, courseName: String) {
        
        let scoreToPar = "Even"
        let newScorecard = Scorecard(totalScore: totalScore, scoreToPar: scoreToPar, courseName: courseName)
        scorecards.append(newScorecard)
    }
    
    // Update
    func updateScorecard(scorecard: Scorecard, totalScore: String, courseName: String) {
        scorecard.totalScore = totalScore
        scorecard.courseName = courseName
    }
}
