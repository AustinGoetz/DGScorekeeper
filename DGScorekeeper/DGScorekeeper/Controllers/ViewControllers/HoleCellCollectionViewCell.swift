//
//  HoleCellCollectionViewCell.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/14/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class HoleCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var plusButtonOutlet: UIButton!
    @IBOutlet weak var minusButtonOutlet: UIButton!
    
    
    @IBAction func plusButtonTapped(_ sender: Any) {
//        guard let newScore = Int(scoreLabel.text) else {return}
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        
        scoreLabel.text = "2"
    }
    
}
