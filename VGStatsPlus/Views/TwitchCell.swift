//
//  TwitchCell.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 11/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

class TwitchCell: UICollectionViewCell {
    
    @IBOutlet var gameImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    func setup(game: Game) {
        if game.gameImage != nil {
            game.downloadGameImage {
                self.gameImageView.image = game.gameImage
            }
        }
        nameLabel.text = game.gameName
        
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width:4,height: 2.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false;
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
}
