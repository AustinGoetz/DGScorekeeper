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
    func addScorecard(score: String, course: String) {
        let newScorecard = Scorecard(totalScore: score, courseName: course)
        scorecards.append(newScorecard)
        saveToPersistentStore()
    }
    
    // Update
    func updateScorecard(scorecard: Scorecard, score: String, course: String) {
        scorecard.totalScore = score
        scorecard.courseName = course
        saveToPersistentStore()
    }
    
    func deleteScorecard(scorecard: Scorecard) {
        guard let scorecardToDelete = scorecards.firstIndex(of: scorecard) else { return }
        scorecards.remove(at: scorecardToDelete)
        saveToPersistentStore()
    }
    
    // MARK: - Peristence
    func createFileURLForPersistence() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("ScorecardKeeper.json")
        return fileURL
    }
    
    
    func saveToPersistentStore() {
        let jsonEncoder = JSONEncoder()
        
        do {
            let noteJSON = try jsonEncoder.encode(scorecards)
            try noteJSON.write(to: createFileURLForPersistence())
        } catch {
            print("Error encoding Notes: \(error.localizedDescription) \n ----- \n \(error)")
        }
    }
    
    
    func loadFromPersistentStore() {
        let jsonDecoder = JSONDecoder()
        
        do {
            let jsonData = try Data(contentsOf: createFileURLForPersistence())
            let decodedNotes = try jsonDecoder.decode([Scorecard].self, from: jsonData)
            scorecards = decodedNotes
        } catch {
            print("Error decoding Notes: \(error.localizedDescription) \n ----- \n \(error)")
        }
    }
}
