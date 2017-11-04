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

    
    @IBOutlet weak var leftSidePlayerNameLabel: UILabel!
    @IBOutlet var leftSideKDALabel: UILabel!
    @IBOutlet var leftSideCSLabel: UILabel!
    @IBOutlet var leftSideGoldLabel: UILabel!
    
    
    //MARK: - Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    //MARK: - Class Methods
    func setupCell(participant: ParticipantResource?) {
        guard participant != nil else { return }
        let player = participant!.player
        
        leftSideCharacterImageView.image = UIImage(named: "\(participant!.actor!.description)")
        
        if participant!.items!.count >= 1 {
            leftSideItemOneImageView.image = UIImage(named: "\(participant!.items![0])")
        }
        if participant!.items!.count >= 2 {
            leftSideItemTwoImageView.image = UIImage(named: "\(participant!.items![1])")
        }
        if participant!.items!.count >= 3 {
            leftSideItemThreeImageView.image = UIImage(named: "\(participant!.items![2])")
        }
        if participant!.items!.count >= 4 {
            leftSideItemFourImageView.image = UIImage(named: "\(participant!.items![3])")
        }
        if participant!.items!.count >= 5 {
                leftSideItemFiveImageView.image = UIImage(named: "\(participant!.items![4])")
        }
        if participant!.items!.count == 6 {
            leftSideItemSixImageView.image = UIImage(named: "\(participant!.items![5])")
        }
        
        leftSidePlayerNameLabel.text = "\(player!.name!.description)"
        leftSideKDALabel.text = "\(participant!.kills!.description) / \(participant!.deaths!.description) / \(participant!.assists!.description)"
        leftSideCSLabel.text = "\(participant!.minionKills!.description)"
        leftSideGoldLabel.text = "\(participant!.gold!.description)"
        
        print("\n")
        print("----------Left")
        print(participant)
        print("----------Left")
        print("\n")
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
    
    
    @IBOutlet weak var rightSidePlayerNameLabel: UILabel!
    @IBOutlet var rightSideKDALabel: UILabel!
    @IBOutlet var rightSideCSLabel: UILabel!
    @IBOutlet var rightSideGoldLabel: UILabel!
    
    //MARK: - Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    //MARK: - Class Methods
    func setupCell(participant: ParticipantResource?) {
        guard participant != nil else { return }
        let player = participant!.player
        
        rightSideCharacterImageView.image = UIImage(named: "\(participant!.actor!.description)")
        
        if participant!.items!.count >= 1 {
            rightSideItemOneImageView.image = UIImage(named: "\(participant!.items![0].description)")
        }
        if participant!.items!.count >= 2 {
            rightSideItemTwoImageView.image = UIImage(named: "\(participant!.items![1].description)")
        }
        if participant!.items!.count >= 3 {
            rightSideItemThreeImageView.image = UIImage(named: "\(participant!.items![2].description)")
        }
        if participant!.items!.count >= 4 {
            rightSideItemFourImageView.image = UIImage(named: "\(participant!.items![3].description)")
        }
        if participant!.items!.count >= 5 {
            rightSideItemFiveImageView.image = UIImage(named: "\(participant!.items![4].description)")
        }
        if participant!.items!.count == 6 {
            rightSideItemSixImageView.image = UIImage(named: "\(participant!.items![5].description)")
        }
        
        rightSidePlayerNameLabel.text = "\(player!.name!.description)"
        rightSideKDALabel.text = "\(participant!.kills!.description) / \(participant!.deaths!.description) / \(participant!.assists!.description)"
        rightSideCSLabel.text = "\(participant!.minionKills!.description)"
        rightSideGoldLabel.text = "\(participant!.gold!.description)"

        print("\n")
        print("----------Right")
        print(participant)
        print("----------Right")
        print("\n")
    }
    
}

