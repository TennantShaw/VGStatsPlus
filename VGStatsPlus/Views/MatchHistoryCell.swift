//
//  MatchHistoryCell.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 10/8/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import VaingloryAPI

class MatchHistoryCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet var matchTypeLabel: UILabel!
    @IBOutlet var characterUsedLabel: UILabel!
    @IBOutlet var killLabel: UILabel!
    @IBOutlet var deathLabel: UILabel!
    @IBOutlet var assistLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Class Methods
    func setup(matchDetails: MatchResource) {
        matchTypeLabel.text = matchDetails.gameMode!
    }
}
