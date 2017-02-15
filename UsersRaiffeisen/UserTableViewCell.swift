//
//  UserTableViewCell.swift
//  UsersRaiffeisen
//
//  Created by Sabina Buruiana on 2/15/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userSubtitileInfo: UILabel!
    @IBOutlet weak var userTitleInfo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
