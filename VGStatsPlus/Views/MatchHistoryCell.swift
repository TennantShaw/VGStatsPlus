//
//  MatchHistoryCell.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import VaingloryAPI

class LeftSideCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet var leftSideCharacterImageView: UIImageView!
    @IBOutlet var leftSideItemOneImageView: UIImageView!
    @IBOutlet var leftSideItemTwoImageView: UIImageView!
    @IBOutlet var leftSideItemThreeImageView: UIImageView!
    @IBOutlet var leftSideItemFourImageView: UIImageView!
    @IBOutlet var leftSideItemFiveImageView: UIImageView!
    @IBOutlet var leftSideItemSixImageView: UIImageView!

    @IBOutlet var leftSideKDALabel: UILabel!
    @IBOutlet var leftSideCSLabel: UILabel!
    @IBOutlet var leftSideGoldLabel: UILabel!
    
    
    //MARK: - Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    //MARK: - Class Methods
    func setupCell(match: MatchResource?) {
    }

}

class RightSideCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet var rightSideCharacterImageView: UIImageView!
    @IBOutlet var rightSideItemOneImageView: UIImageView!
    @IBOutlet var rightSideItemFiveImageView: UIImageView!
    @IBOutlet var rightSideItemFourImageView: UIImageView!
    @IBOutlet var rightSideItemThreeImageView: UIImageView!
    @IBOutlet var rightSideItemSixImageView: UIImageView!
    @IBOutlet var rightSideItemTwoImageView: UIImageView!
    
    @IBOutlet var rightSideKDALabel: UILabel!
    @IBOutlet var rightSideCSLabel: UILabel!
    @IBOutlet var rightSideGoldLabel: UILabel!
    
    //MARK: - Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    //MARK: - Class Methods
    func setupCell(match: MatchResource?) {
    }
}

