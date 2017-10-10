//
//  PlayerCell.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/5/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import VaingloryAPI

class PlayerCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - Class Methods
    func setup(player: PlayerResource) {
        nameLabel.text = player.name!
        levelLabel.text = "Level: \(player.level!)"
        regionLabel.text = "Region: \(player.shardId!)"
        rankLabel.text = "Rank:  \(player.playedRanked!)"
        winsLabel.text = "Total Wins:  \(player.wins!)"
    }
    
}
