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
    
    @IBOutlet var collectionView: UICollectionView!
    
    var delegate: PlayerProfileViewController?
    
    var matches: [MatchResource] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

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
    
    @IBOutlet var matchImageView: UIImageView!
    @IBOutlet var matchName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(match: MatchResource) {
        if match.endGameReason == "victory" {
            matchImageView.image = UIImage(named: "victory")
        } else {
            matchImageView.image = UIImage(named: "defeat")
        }
            matchName.text = match.gameMode
    }
}
