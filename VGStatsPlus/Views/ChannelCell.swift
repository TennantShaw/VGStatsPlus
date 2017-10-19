//
//  ChannelCell.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

class ChannelCell: UICollectionViewCell {
    //MARK: - Outlets
    @IBOutlet var channelImage: UIImageView!
    @IBOutlet var channelNameLabel: UILabel!
    
    
    //MARK: - Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10.0
    }
    
    func setupCell(channel: Channel) {
        channelNameLabel.text = channel.channelTitle
        channelImage.image = UIImage(named: channel.channelImage)
    }
    
}
