//
//  SelectMatchCell.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 12/17/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import VaingloryAPI

class SelectMatchCell: UICollectionViewCell {
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var matchStatusLabel: UILabel!
    @IBOutlet weak var killsLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var goldsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(match: MatchResource) {
        if match.gameMode == "ranked" {
            nameLabel.text = "Ranked"
        } else if match.gameMode == "blitz_pvp_ranked" {
            nameLabel.text = "Blitz"
        } else if match.gameMode == "casual_aral" {
            nameLabel.text = "Battale Royale"
        } else if match.gameMode == "blitz_rounds_pvp_casual" {
            nameLabel.text = "Onslaught"
        } else {
            nameLabel.text = "need to add gameMode type to be recognized"
        }
        
        let roster = match.rosters!
        let participantArray1 = roster[0].participants!
        let participantArray2 = roster[1].participants!
        let player1 = participantArray1[0].player!
        let player2 = participantArray1[1].player!
        let player3 = participantArray1[2].player!
        let player4 = participantArray2[0].player!
        let player5 = participantArray2[1].player!
        let player6 = participantArray2[2].player!
        
        if player1.name == "TennantTheVast" {
            if participantArray1[0].winner?.description == "true" {
                heroImageView.image = UIImage(named: "victory")
                matchStatusLabel.text = "Victory"
            } else {
                heroImageView.image = UIImage(named: "defeat")
                matchStatusLabel.text = "Defeat"
            }
            killsLabel.text = participantArray1[0].kills?.description
            deathsLabel.text = participantArray1[0].deaths?.description
            goldsLabel.text = participantArray1[0].gold?.description
            heroImageView.image = UIImage(named: participantArray1[0].actor!)
        } else if player2.name == "TennantTheVast" {
            if participantArray1[1].winner?.description == "true" {
                heroImageView.image = UIImage(named: "victory")
                matchStatusLabel.text = "Victory"
            } else {
                heroImageView.image = UIImage(named: "defeat")
                matchStatusLabel.text = "Defeat"
            }
            killsLabel.text = participantArray1[1].kills?.description
            deathsLabel.text = participantArray1[1].deaths?.description
            goldsLabel.text = participantArray1[1].gold?.description
            heroImageView.image = UIImage(named: participantArray1[1].actor!)
        } else if player3.name == "TennantTheVast" {
            if participantArray1[2].winner?.description == "true" {
                heroImageView.image = UIImage(named: "victory")
                matchStatusLabel.text = "Victory"
            } else {
                heroImageView.image = UIImage(named: "defeat")
                matchStatusLabel.text = "Defeat"
            }
            killsLabel.text = participantArray1[2].kills?.description
            deathsLabel.text = participantArray1[2].deaths?.description
            goldsLabel.text = participantArray1[2].gold?.description
            heroImageView.image = UIImage(named: participantArray1[2].actor!)
        } else if player4.name == "TennantTheVast" {
            if participantArray2[0].winner?.description == "true" {
                heroImageView.image = UIImage(named: "victory")
                matchStatusLabel.text = "Victory"
            } else {
                heroImageView.image = UIImage(named: "defeat")
                matchStatusLabel.text = "Defeat"
            }
            killsLabel.text = participantArray2[0].kills?.description
            deathsLabel.text = participantArray2[0].deaths?.description
            goldsLabel.text = participantArray2[0].gold?.description
            heroImageView.image = UIImage(named: participantArray2[0].actor!)
        } else if player5.name == "TennantTheVast" {
            if participantArray2[1].winner?.description == "true" {
                heroImageView.image = UIImage(named: "victory")
                matchStatusLabel.text = "Victory"
            } else {
                heroImageView.image = UIImage(named: "defeat")
                matchStatusLabel.text = "Defeat"
            }
            killsLabel.text = participantArray2[1].kills?.description
            deathsLabel.text = participantArray2[1].deaths?.description
            goldsLabel.text = participantArray2[1].gold?.description
            heroImageView.image = UIImage(named: participantArray2[1].actor!)
        } else if player6.name == "TennantTheVast" {
            if participantArray2[2].winner?.description == "true" {
                heroImageView.image = UIImage(named: "victory")
                matchStatusLabel.text = "Victory"
            } else {
                heroImageView.image = UIImage(named: "defeat")
                matchStatusLabel.text = "Defeat"
            }
            killsLabel.text = participantArray2[2].kills?.description
            deathsLabel.text = participantArray2[2].deaths?.description
            goldsLabel.text = participantArray2[2].gold?.description
            heroImageView.image = UIImage(named: participantArray2[2].actor!)
        } else {
            print("There is an error going on here")
        }
    }
    
}
