//
//  ScorecardListViewController.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/8/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class ScorecardListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        self.tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ScorecardController.shared.scorecards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scorecardCell", for: indexPath)
        
        let scorecard = ScorecardController.shared.scorecards[indexPath.row]
        
        cell.textLabel?.text = scorecard.courseName
        cell.detailTextLabel?.text = scorecard.totalScore
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScorecardEntryVC" {
            if let scorecardEntryVC = segue.destination as? ScorecardEntryViewController,
                let selectedRow = tableViewOutlet.indexPathForSelectedRow?.row {
                let scorecard = ScorecardController.shared.scorecards[selectedRow]
                scorecardEntryVC.scorecard = scorecard
            }
        }
    }
}
