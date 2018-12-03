//
//  ViewControllerTableViewCell.swift
//  NotMyMeetups
//
//  Created by Zehra Abacioglu on 12/3/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var labelEvent: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
