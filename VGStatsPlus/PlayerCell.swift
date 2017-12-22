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
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var skillTierImage: UIImageView!
    @IBOutlet var userImageView: CircleImage!
    
    

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
        winsLabel.text = "Total Wins:  \(player.wins!)"
        VGFirebaseDB.instance.getUserInfo(withID: SavedStatus.instance.userID) { (name, image) in
            self.userImageView.downloadedFrom(link: image)
        }
    
        if player1.name == player.name! {
            if participantArray1[0].skillTier == 0 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01a")
            } else if participantArray1[0].skillTier == 1 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01b")
            } else if participantArray1[0].skillTier == 2 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01c")
            } else if participantArray1[0].skillTier == 3 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02a")
            } else if participantArray1[0].skillTier == 4 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02b")
            } else if participantArray1[0].skillTier == 5 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02c")
            } else if participantArray1[0].skillTier == 6 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03a")
            } else if participantArray1[0].skillTier == 7 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03b")
            } else if participantArray1[0].skillTier == 8 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03c")
            } else if participantArray1[0].skillTier == 9 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04a")
            } else if participantArray1[0].skillTier == 10 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04b")
            } else if participantArray1[0].skillTier == 11 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04c")
            } else if participantArray1[0].skillTier == 12 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05a")
            } else if participantArray1[0].skillTier == 13 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05b")
            } else if participantArray1[0].skillTier == 14 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05c")
            } else if participantArray1[0].skillTier == 15 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06a")
            } else if participantArray1[0].skillTier == 16 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06b")
            } else if participantArray1[0].skillTier == 17 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06c")
            } else if participantArray1[0].skillTier == 18 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07a")
            } else if participantArray1[0].skillTier == 19 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07b")
            } else if participantArray1[0].skillTier == 20 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07c")
            } else if participantArray1[0].skillTier == 21 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08a")
            } else if participantArray1[0].skillTier == 22 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08b")
            } else if participantArray1[0].skillTier == 23 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08c")
            } else if participantArray1[0].skillTier == 24 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09a")
            } else if participantArray1[0].skillTier == 25 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09b")
            } else if participantArray1[0].skillTier == 26 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09c")
            } else if participantArray1[0].skillTier == 27 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10a")
            } else if participantArray1[0].skillTier == 28 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10b")
            } else if participantArray1[0].skillTier == 29 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10c")
            }
        } else if player2.name == player.name! {
            if participantArray1[1].skillTier == 0 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01a")
            } else if participantArray1[1].skillTier == 1 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01b")
            } else if participantArray1[1].skillTier == 2 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01c")
            } else if participantArray1[1].skillTier == 3 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02a")
            } else if participantArray1[1].skillTier == 4 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02b")
            } else if participantArray1[1].skillTier == 5 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02c")
            } else if participantArray1[1].skillTier == 6 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03a")
            } else if participantArray1[1].skillTier == 7 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03b")
            } else if participantArray1[1].skillTier == 8 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03c")
            } else if participantArray1[1].skillTier == 9 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04a")
            } else if participantArray1[1].skillTier == 10 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04b")
            } else if participantArray1[1].skillTier == 11 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04c")
            } else if participantArray1[1].skillTier == 12 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05a")
            } else if participantArray1[1].skillTier == 13 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05b")
            } else if participantArray1[1].skillTier == 14 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05c")
            } else if participantArray1[1].skillTier == 15 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06a")
            } else if participantArray1[1].skillTier == 16 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06b")
            } else if participantArray1[1].skillTier == 17 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06c")
            } else if participantArray1[1].skillTier == 18 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07a")
            } else if participantArray1[1].skillTier == 19 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07b")
            } else if participantArray1[1].skillTier == 20 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07c")
            } else if participantArray1[1].skillTier == 21 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08a")
            } else if participantArray1[1].skillTier == 22 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08b")
            } else if participantArray1[1].skillTier == 23 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08c")
            } else if participantArray1[1].skillTier == 24 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09a")
            } else if participantArray1[1].skillTier == 25 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09b")
            } else if participantArray1[1].skillTier == 26 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09c")
            } else if participantArray1[1].skillTier == 27 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10a")
            } else if participantArray1[1].skillTier == 28 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10b")
            } else if participantArray1[1].skillTier == 29 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10c")
            }
        } else if player3.name == player.name! {
            if participantArray1[2].skillTier == 0 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01a")
            } else if participantArray1[2].skillTier == 1 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01b")
            } else if participantArray1[2].skillTier == 2 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01c")
            } else if participantArray1[2].skillTier == 3 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02a")
            } else if participantArray1[2].skillTier == 4 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02b")
            } else if participantArray1[2].skillTier == 5 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02c")
            } else if participantArray1[2].skillTier == 6 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03a")
            } else if participantArray1[2].skillTier == 7 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03b")
            } else if participantArray1[2].skillTier == 8 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03c")
            } else if participantArray1[2].skillTier == 9 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04a")
            } else if participantArray1[2].skillTier == 10 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04b")
            } else if participantArray1[2].skillTier == 11 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04c")
            } else if participantArray1[2].skillTier == 12 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05a")
            } else if participantArray1[2].skillTier == 13 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05b")
            } else if participantArray1[2].skillTier == 14 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05c")
            } else if participantArray1[2].skillTier == 15 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06a")
            } else if participantArray1[2].skillTier == 16 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06b")
            } else if participantArray1[2].skillTier == 17 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06c")
            } else if participantArray1[2].skillTier == 18 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07a")
            } else if participantArray1[2].skillTier == 19 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07b")
            } else if participantArray1[2].skillTier == 20 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07c")
            } else if participantArray1[2].skillTier == 21 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08a")
            } else if participantArray1[2].skillTier == 22 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08b")
            } else if participantArray1[2].skillTier == 23 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08c")
            } else if participantArray1[2].skillTier == 24 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09a")
            } else if participantArray1[2].skillTier == 25 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09b")
            } else if participantArray1[2].skillTier == 26 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09c")
            } else if participantArray1[2].skillTier == 27 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10a")
            } else if participantArray1[2].skillTier == 28 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10b")
            } else if participantArray1[2].skillTier == 29 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10c")
            }
        } else if player4.name == player.name! {
            if participantArray2[0].skillTier == 0 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01a")
            } else if participantArray2[0].skillTier == 1 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01b")
            } else if participantArray2[0].skillTier == 2 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01c")
            } else if participantArray2[0].skillTier == 3 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02a")
            } else if participantArray2[0].skillTier == 4 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02b")
            } else if participantArray2[0].skillTier == 5 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02c")
            } else if participantArray2[0].skillTier == 6 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03a")
            } else if participantArray2[0].skillTier == 7 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03b")
            } else if participantArray2[0].skillTier == 8 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03c")
            } else if participantArray2[0].skillTier == 9 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04a")
            } else if participantArray2[0].skillTier == 10 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04b")
            } else if participantArray2[0].skillTier == 11 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04c")
            } else if participantArray2[0].skillTier == 12 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05a")
            } else if participantArray2[0].skillTier == 13 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05b")
            } else if participantArray2[0].skillTier == 14 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05c")
            } else if participantArray2[0].skillTier == 15 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06a")
            } else if participantArray2[0].skillTier == 16 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06b")
            } else if participantArray2[0].skillTier == 17 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06c")
            } else if participantArray2[0].skillTier == 18 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07a")
            } else if participantArray2[0].skillTier == 19 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07b")
            } else if participantArray2[0].skillTier == 20 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07c")
            } else if participantArray2[0].skillTier == 21 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08a")
            } else if participantArray2[0].skillTier == 22 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08b")
            } else if participantArray2[0].skillTier == 23 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08c")
            } else if participantArray2[0].skillTier == 24 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09a")
            } else if participantArray2[0].skillTier == 25 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09b")
            } else if participantArray2[0].skillTier == 26 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09c")
            } else if participantArray2[0].skillTier == 27 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10a")
            } else if participantArray2[0].skillTier == 28 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10b")
            } else if participantArray2[0].skillTier == 29 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10c")
            }
        } else if player5.name == player.name! {
            if participantArray2[1].skillTier == 0 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01a")
            } else if participantArray2[1].skillTier == 1 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01b")
            } else if participantArray2[1].skillTier == 2 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01c")
            } else if participantArray2[1].skillTier == 3 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02a")
            } else if participantArray2[1].skillTier == 4 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02b")
            } else if participantArray2[1].skillTier == 5 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02c")
            } else if participantArray2[1].skillTier == 6 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03a")
            } else if participantArray2[1].skillTier == 7 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03b")
            } else if participantArray2[1].skillTier == 8 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03c")
            } else if participantArray2[1].skillTier == 9 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04a")
            } else if participantArray2[1].skillTier == 10 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04b")
            } else if participantArray2[1].skillTier == 11 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04c")
            } else if participantArray2[1].skillTier == 12 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05a")
            } else if participantArray2[1].skillTier == 13 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05b")
            } else if participantArray2[1].skillTier == 14 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05c")
            } else if participantArray2[1].skillTier == 15 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06a")
            } else if participantArray2[1].skillTier == 16 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06b")
            } else if participantArray2[1].skillTier == 17 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06c")
            } else if participantArray2[1].skillTier == 18 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07a")
            } else if participantArray2[1].skillTier == 19 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07b")
            } else if participantArray2[1].skillTier == 20 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07c")
            } else if participantArray2[1].skillTier == 21 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08a")
            } else if participantArray2[1].skillTier == 22 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08b")
            } else if participantArray2[1].skillTier == 23 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08c")
            } else if participantArray2[1].skillTier == 24 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09a")
            } else if participantArray2[1].skillTier == 25 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09b")
            } else if participantArray2[1].skillTier == 26 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09c")
            } else if participantArray2[1].skillTier == 27 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10a")
            } else if participantArray2[1].skillTier == 28 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10b")
            } else if participantArray2[1].skillTier == 29 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10c")
            }
        } else if player6.name == player.name! {
            if participantArray2[2].skillTier == 0 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01a")
            } else if participantArray2[2].skillTier == 1 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01b")
            } else if participantArray2[2].skillTier == 2 {
                rankLabel.text = "Just Beginning"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_01c")
            } else if participantArray2[2].skillTier == 3 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02a")
            } else if participantArray2[2].skillTier == 4 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02b")
            } else if participantArray2[2].skillTier == 5 {
                rankLabel.text = "Getting There"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_02c")
            } else if participantArray2[2].skillTier == 6 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03a")
            } else if participantArray2[2].skillTier == 7 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03b")
            } else if participantArray2[2].skillTier == 8 {
                rankLabel.text = "Rock Solid"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_03c")
            } else if participantArray2[2].skillTier == 9 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04a")
            } else if participantArray2[2].skillTier == 10 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04b")
            } else if participantArray2[2].skillTier == 11 {
                rankLabel.text = "Worthy Foe"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_04c")
            } else if participantArray2[2].skillTier == 12 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05a")
            } else if participantArray2[2].skillTier == 13 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05b")
            } else if participantArray2[2].skillTier == 14 {
                rankLabel.text = "Got Swagger"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_05c")
            } else if participantArray2[2].skillTier == 15 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06a")
            } else if participantArray2[2].skillTier == 16 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06b")
            } else if participantArray2[2].skillTier == 17 {
                rankLabel.text = "Credible Threat"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_06c")
            } else if participantArray2[2].skillTier == 18 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07a")
            } else if participantArray2[2].skillTier == 19 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07b")
            } else if participantArray2[2].skillTier == 20 {
                rankLabel.text = "The Hotness"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_07c")
            } else if participantArray2[2].skillTier == 21 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08a")
            } else if participantArray2[2].skillTier == 22 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08b")
            } else if participantArray2[2].skillTier == 23 {
                rankLabel.text = "Simply Amazing"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_08c")
            } else if participantArray2[2].skillTier == 24 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09a")
            } else if participantArray2[2].skillTier == 25 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09b")
            } else if participantArray2[2].skillTier == 26 {
                rankLabel.text = "Pinnacle of Awesome"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_09c")
            } else if participantArray2[2].skillTier == 27 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.3333, green: 0.2902, blue: 0.2353, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10a")
            } else if participantArray2[2].skillTier == 28 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.753, green: 0.753, blue: 0.753, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10b")
            } else if participantArray2[2].skillTier == 29 {
                rankLabel.text = "Vainglorious"
                rankLabel.textColor = UIColor(red: 0.5426, green: 0.4574, blue: 0.0, alpha: 1)
                skillTierImage.image = UIImage(named: "tier_10c")
            }
        } else {
            print("There is an error going on here at line 598 in MatchesCell.swift")
        }

    }
    
}
