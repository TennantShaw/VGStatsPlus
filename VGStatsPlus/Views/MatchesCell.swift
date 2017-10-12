//
//  MatchesCell.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/8/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import VaingloryAPI

class MatchesCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet var collectionView: UICollectionView!
    
    
    //MARK: - Properties
    var delegate: PlayerProfileViewController?
    
    var matches: [MatchResource] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    
    //MARK: - Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension MatchesCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return matches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "matchCollectionCell", for: indexPath) as? MatchesCollectionCell else { return UICollectionViewCell() }
        cell.setupCell(match: matches[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.frame.size.width / 3) + 20, height: self.frame.size.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        VGDataSource.instance.getMatch(withId: matches[indexPath.row].id, regional: matches[indexPath.row].shardId!) { (success) in
            if success {
                print(success)
            }
        }
    }
}

class MatchesCollectionCell: UICollectionViewCell {
    //MARK: - Match Cell Outlets
    @IBOutlet var matchImageView: UIImageView!
    @IBOutlet var matchName: UILabel!
    @IBOutlet var winOrLossLabel: UILabel!
    @IBOutlet var killLabel: UILabel!
    @IBOutlet var deathsLabel: UILabel!
    @IBOutlet var assistsLabel: UILabel!
    
    //MARK: - Match Cell Nib
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    //MARK: - MatchCollectionCell Class Methods
    func setupCell(match: MatchResource) {
        if match.endGameReason == "victory" {
            matchImageView.image = UIImage(named: "victory")
            winOrLossLabel.text = "Victory"
        } else {
            matchImageView.image = UIImage(named: "defeat")
            winOrLossLabel.text = "Defeat"
        }
        
        if match.gameMode == "ranked" {
            matchName.text = "Ranked"
        } else if match.gameMode == "blitz_pvp_ranked" {
            matchName.text = "Blitz"
        } else if match.gameMode == "casual_aral" {
            matchName.text = "Battale Royale"
        } else {
            matchName.text = "need to add gameMode type to be recognized"
        }     }
}
