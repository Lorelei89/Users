//
//  UserCollectionViewCell.swift
//  DemoApp
//
//  Created by Sabina Buruiana on 2/14/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var userPhoto: RoundFullCircleView!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
      
        super.awakeFromNib()
        // Initialization code
        
        layer.cornerRadius = self.frame.height / 6.0
        layer.masksToBounds = true
    }

}
