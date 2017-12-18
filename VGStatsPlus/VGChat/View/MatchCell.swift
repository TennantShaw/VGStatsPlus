//
//  MatchCell.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 12/18/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import VaingloryAPI

class MatchCell: UITableViewCell {
    
    @IBOutlet weak var matchImage: CircleImage!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var selectedMatch: MatchResource!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(match: Message) {
        
        VGFirebaseDB.instance.getUserInfo(withID: match.senderId) { (name, image) in
            self.nameLabel.text = name
        }
        
        VGDataSource.instance.vainGloryAPI.getMatch(withId: match.content, shard: Shard(rawValue: match.userShard)!) { (oMatchResource, oError) in
            if oError != nil {
                print("Could not get Match")
            } else {
                self.selectedMatch = oMatchResource
                let roster = self.selectedMatch.rosters!
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
                        self.matchImage.image = UIImage(named: "victory")
                        self.messageLabel.text = "Victory"
                    } else {
                        self.matchImage.image = UIImage(named: "defeat")
                        self.messageLabel.text = "Defeat"
                    }
                    self.matchImage.image = UIImage(named: participantArray1[0].actor!)
                } else if player2.name == "TennantTheVast" {
                    if participantArray1[1].winner?.description == "true" {
                        self.matchImage.image = UIImage(named: "victory")
                        self.messageLabel.text = "Victory"
                    } else {
                        self.matchImage.image = UIImage(named: "defeat")
                        self.messageLabel.text = "Defeat"
                    }
                    self.matchImage.image = UIImage(named: participantArray1[1].actor!)
                } else if player3.name == "TennantTheVast" {
                    if participantArray1[2].winner?.description == "true" {
                        self.matchImage.image = UIImage(named: "victory")
                        self.messageLabel.text = "Victory"
                    } else {
                        self.matchImage.image = UIImage(named: "defeat")
                        self.messageLabel.text = "Defeat"
                    }
                    self.matchImage.image = UIImage(named: participantArray1[2].actor!)
                } else if player4.name == "TennantTheVast" {
                    if participantArray2[0].winner?.description == "true" {
                        self.matchImage.image = UIImage(named: "victory")
                        self.messageLabel.text = "Victory"
                    } else {
                        self.matchImage.image = UIImage(named: "defeat")
                        self.messageLabel.text = "Defeat"
                    }
                    self.matchImage.image = UIImage(named: participantArray2[0].actor!)
                } else if player5.name == "TennantTheVast" {
                    if participantArray2[1].winner?.description == "true" {
                        self.matchImage.image = UIImage(named: "victory")
                        self.messageLabel.text = "Victory"
                    } else {
                        self.matchImage.image = UIImage(named: "defeat")
                        self.messageLabel.text = "Defeat"
                    }
                    self.matchImage.image = UIImage(named: participantArray2[1].actor!)
                } else if player6.name == "TennantTheVast" {
                    if participantArray2[2].winner?.description == "true" {
                        self.matchImage.image = UIImage(named: "victory")
                        self.messageLabel.text = "Victory"
                    } else {
                        self.matchImage.image = UIImage(named: "defeat")
                        self.messageLabel.text = "Defeat"
                    }
                    self.matchImage.image = UIImage(named: participantArray2[2].actor!)
                } else {
                    print("There is an error going on here")
                }
            }
        }
    }
    
}
