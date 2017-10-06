//
//  MatchHistoryCell.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 10/6/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import UIKit
import VaingloryAPI

class MatchHistoryCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet var wonOrLossImageView: UIImageView!
    @IBOutlet var matchTypeLabel: UILabel!
    @IBOutlet var characterUsedLabel: UILabel!
    @IBOutlet var killDeathAssistLabel: UILabel!
    @IBOutlet var killsLabel: UILabel!
    @IBOutlet var deathsLabel: UILabel!
    @IBOutlet var assistsLabel: UILabel!
    
    
    //MARK: - Class Methods
    func setMatch(match: Match) {
        let winOrLoseString = match.endGameReason
        wonOrLossImageView.image = UIImage(named: winOrLoseString!)
        matchTypeLabel.text = ("\(match.gameMode )\(match.type)")
        
    }
}
