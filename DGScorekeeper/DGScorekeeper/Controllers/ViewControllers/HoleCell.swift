//
//  HoleCell.swift
//  DGScorekeeper
//
//  Created by Austin Goetz on 11/12/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let holeImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "dgbasket"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let holeTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Hole 1", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 50)])
        return textView
    }()
    
}
