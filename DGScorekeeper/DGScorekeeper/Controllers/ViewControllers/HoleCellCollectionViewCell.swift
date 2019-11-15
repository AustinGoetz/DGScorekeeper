//
//  HoleCellCollectionViewCell.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/14/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class HoleCellCollectionViewCell: UICollectionViewCell {
    
    var score = 3 {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var plusButtonOutlet: UIButton!
    @IBOutlet weak var minusButtonOutlet: UIButton!
    
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        score += 1
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        score -= 1
    }
    
    func updateUI() {
        scoreLabel.text = "\(score)"
    }
    
    override func prepareForReuse() {
        score = 3
    }
}
