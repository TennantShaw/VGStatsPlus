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
    

    //MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    //MARK: - Class Methods
    func setup(player: PlayerResource, match: MatchResource) {
        let roster = match.rosters!
        let participantArray1 = roster[0].participants!
        let participantArray2 = roster[1].participants!
        let player1 = participantArray1[0].player!
        let player2 = participantArray1[1].player!
        let player3 = participantArray1[2].player!
        let player4 = participantArray2[0].player!
        let player5 = participantArray2[1].player!
        let player6 = participantArray2[2].player!

        
        nameLabel.text = player.name!
        levelLabel.text = "Level: \(player.level!)"
        regionLabel.text = "Region: \(player.shardId!)"
//        rankLabel.text = "Rank:  \(player.playedRanked!)"
        winsLabel.text = "Total Wins:  \(player.wins!)"
        
        if player1.name == "TennantTheVast" {
            rankLabel.text = "Rank: \(participantArray1[0].skillTier)"
        } else if player2.name == "TennantTheVast" {
            rankLabel.text = "Rank: \(participantArray1[1].skillTier)"
        } else if player3.name == "TennantTheVast" {
            rankLabel.text = "Rank: \(participantArray1[2].skillTier)"
        } else if player4.name == "TennantTheVast" {
            rankLabel.text = "Rank: \(participantArray2[0].skillTier)"
        } else if player5.name == "TennantTheVast" {
            rankLabel.text = "Rank: \(participantArray2[1].skillTier)"
        } else if player6.name == "TennantTheVast" {
            rankLabel.text = "Rank: \(participantArray2[2].skillTier)"
        } else {
            print("There is an error going on here at line 128 in MatchesCell.swift")
        }

    }
    
}
