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
    }
    
}
