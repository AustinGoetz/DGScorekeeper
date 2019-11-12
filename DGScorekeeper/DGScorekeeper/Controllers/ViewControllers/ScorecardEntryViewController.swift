//
//  ScorecardEntryViewController.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/11/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class ScorecardEntryViewController: UIViewController {
    
    // Properties
    var scorecardLandingPad: Scorecard?

    // MARK: - Outlets
    @IBOutlet weak var courseNameTextField: UITextField!
    @IBOutlet weak var totalScoreTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let courseName = courseNameTextField.text,
            let scoreTotal = totalScoreTextField.text else { return }
        
        if let scorecardToBeupdated = scorecardLandingPad {
            ScorecardController.shared.updateScorecard(scorecard: scorecardToBeupdated, score: scoreTotal, course: courseName)
        } else {
            ScorecardController.shared.addScorecard(score: scoreTotal, course: courseName)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        guard let scorecard = scorecardLandingPad else { return }
        courseNameTextField.text = scorecard.courseName
        totalScoreTextField.text = scorecard.totalScore
    }
}
