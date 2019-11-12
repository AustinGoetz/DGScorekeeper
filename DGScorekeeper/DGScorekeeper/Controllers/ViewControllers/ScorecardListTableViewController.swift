//
//  ScorecardListTableViewController.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/11/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class ScorecardListTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScorecardController.shared.loadFromPersistentStore()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ScorecardController.shared.scorecards.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scorecardCell", for: indexPath)
        
        let scorecardToDisplay = ScorecardController.shared.scorecards[indexPath.row]
        
        cell.textLabel?.text = scorecardToDisplay.courseName
        cell.detailTextLabel?.text = scorecardToDisplay.totalScore
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let scorecardToDelete = ScorecardController.shared.scorecards[indexPath.row]
            ScorecardController.shared.deleteScorecard(scorecard: scorecardToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO
        // Identifier
        if segue.identifier == "addButtonSegue" {
            // Index
            if let index = tableView.indexPathForSelectedRow {
                // Destination
                guard let destinationVC = segue.destination as? ScorecardEntryViewController else { return }
                // Object
                let scorecardToSend = ScorecardController.shared.scorecards[index.row]
                // send Object
                destinationVC.scorecardLandingPad = scorecardToSend
            }
        }
    }
}
