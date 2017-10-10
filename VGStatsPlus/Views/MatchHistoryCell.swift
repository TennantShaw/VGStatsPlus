//
//  MatchHistoryCell.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import VaingloryAPI

class MatchHistoryCell: UITableViewCell {
    
    

    @IBOutlet var matchImageView: UIImageView!
    @IBOutlet var killDeathAssistLabel: UILabel!
    @IBOutlet var assistLabel: UILabel!
    @IBOutlet var deathsLabel: UILabel!
    @IBOutlet var killsLabel: UILabel!
    @IBOutlet var matchTypeLabel: UILabel!
    
    @IBOutlet var characterUserLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(match: MatchResource?) {
        killDeathAssistLabel.text = "WORKS"
        
    }

}
