//
//  MatchHistoryCell.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import VaingloryAPI

class MatchHistoryCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet var leftSideCharacterImageView: UIImageView!
    @IBOutlet var rightSideCharacterImageView: UIImageView!
    
    
    //MARK: - Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: - Class Methods
    func setupCell(match: MatchResource?) {
    }

}
