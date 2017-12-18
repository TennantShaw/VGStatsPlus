//
//  MatchCell.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 12/17/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

class MatchCell: UITableViewCell {

    @IBOutlet weak var matchImage: CircleImage!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(match: Match) {
        
    }

}
