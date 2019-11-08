//
//  ScorecardEntryViewController.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/8/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class ScorecardEntryViewController: UIViewController {
    
    var scorecard: Scorecard?
    
    @IBOutlet weak var courseNameTextField: UITextField!
    @IBOutlet weak var totalScoreTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveRoundButtonTapped(_ sender: Any) {
        
        guard let score = totalScoreTextField.text,
            let course = courseNameTextField.text else { return }
        
        if let scorecard = scorecard {
            ScorecardController.shared.updateScorecard(scorecard: scorecard, totalScore: score, courseName: course)
        } else {
            ScorecardController.shared.addScorecard(totalScore: score, courseName: course)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    func updateViews() {
        guard let scorecard = scorecard else { return }
        courseNameTextField.text = scorecard.courseName
        totalScoreTextField.text = scorecard.totalScore
    }
}
