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
    @IBOutlet var leftSideItemOneImageView: UIImageView!
    @IBOutlet var rightSideItemOneImageView: UIImageView!
    @IBOutlet var leftSideItemTwoImageView: UIImageView!
    @IBOutlet var rightSideItemTwoImageView: UIImageView!
    @IBOutlet var leftSideItemThreeImageView: UIImageView!
    @IBOutlet var rightSideItemThreeImageView: UIImageView!
    @IBOutlet var leftSideItemFourImageView: UIImageView!
    @IBOutlet var rightSideItemFourImageView: UIImageView!
    @IBOutlet var leftSideItemFiveImageView: UIImageView!
    @IBOutlet var rightSideItemFiveImageView: UIImageView!
    @IBOutlet var leftSideItemSixImageView: UIImageView!
    @IBOutlet var rightSideItemSixImageView: UIImageView!

    @IBOutlet var leftSideKDALabel: UILabel!
    @IBOutlet var rightSideKDALabel: UILabel!
    @IBOutlet var leftSideCSLabel: UILabel!
    @IBOutlet var rightSideCSLabel: UILabel!
    @IBOutlet var leftSideGoldLabel: UILabel!
    @IBOutlet var rightSideGoldLabel: UILabel!
    
    
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
