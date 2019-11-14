//
//  HoleCellCollectionViewCell.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/14/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class HoleCellCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
