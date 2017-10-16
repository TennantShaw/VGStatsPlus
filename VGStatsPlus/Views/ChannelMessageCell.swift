//
//  ChannelMessageCell.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

class ChannelMessageCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet var userProfileImage: CircleImage!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    
    //MARK: - Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    //MARK: - Class Methods
    func setup(message: Message) {
        userNameLabel.text = message.senderIGN
        messageLabel.text = message.content
    }

}
