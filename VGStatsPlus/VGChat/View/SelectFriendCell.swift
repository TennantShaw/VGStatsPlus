//
//  SelectFriendCell.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 11/1/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

class SelectFriendCell: UITableViewCell {
    
    @IBOutlet var profileImage: CircleImage!
    @IBOutlet var nameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var isSelected: Bool {
        didSet {
//            self.accessoryType = isSelected ? .checkmark : .none
//            self.nameLabel.textColor = isSelected ? UIColor.darkGray : UIColor.white
        }
    }
}
