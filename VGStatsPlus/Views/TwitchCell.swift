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
    @IBOutlet var streamNameLabel: UILabel!
    @IBOutlet var viewCountLabel: UILabel!
    
    
    
    func setup(stream: Stream) {
        if stream.streamImage != nil {
            stream.downloadStreamImage {
                self.gameImageView.image = stream.streamImage
            }
        }
        nameLabel.text = stream.broadcasterName
        streamNameLabel.text = stream.streamTitle
        viewCountLabel.text = "\(stream.streamViewerCount)"
        
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width:0,height: 1.0)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false;
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
}
