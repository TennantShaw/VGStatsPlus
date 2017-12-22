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
    var delegate: HomeVC?
    
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
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let destinationVC = storyboard.instantiateViewController(withIdentifier: "MatchDetailVC") as! MatchHistoryViewController
                if VGDataSource.instance.selectedMatch != nil {
                    self.delegate?.present(destinationVC, animated: true, completion: nil)
                }
            }
        }
    }
}

class MatchesCollectionCell: UICollectionViewCell {
    //MARK: - Match Cell Outlets
    @IBOutlet var lastPlayedChampionImageView: UIImageView!
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
        if match.gameMode == "ranked" {
            matchName.text = "Ranked"
        } else if match.gameMode == "blitz_pvp_ranked" {
            matchName.text = "Blitz"
        } else if match.gameMode == "casual_aral" {
            matchName.text = "Battale Royale"
        } else if match.gameMode == "blitz_rounds_pvp_casual" {
            matchName.text = "Onslaught"
        } else if match.gameMode == "casual" {
            matchName.text = "Casual"
        } else {
            matchName.text = "need to add gameMode type to be recognized"
        }
        
        let roster = match.rosters!
        let participantArray1 = roster[0].participants!
        let participantArray2 = roster[1].participants!
        let player1 = participantArray1[0].player!
        let player2 = participantArray1[1].player!
        let player3 = participantArray1[2].player!
        let player4 = participantArray2[0].player!
        let player5 = participantArray2[1].player!
        let player6 = participantArray2[2].player!
        
        if player1.name == "TennantTheVast" {
            if participantArray1[0].winner?.description == "true" {
                matchImageView.image = UIImage(named: "victory")
                winOrLossLabel.text = "Victory"
            } else {
                matchImageView.image = UIImage(named: "defeat")
                winOrLossLabel.text = "Defeat"
            }
            killLabel.text = participantArray1[0].kills?.description
            deathsLabel.text = participantArray1[0].deaths?.description
            assistsLabel.text = participantArray1[0].assists?.description
            lastPlayedChampionImageView.image = UIImage(named: participantArray1[0].actor!)
        } else if player2.name == "TennantTheVast" {
            if participantArray1[1].winner?.description == "true" {
                matchImageView.image = UIImage(named: "victory")
                winOrLossLabel.text = "Victory"
            } else {
                matchImageView.image = UIImage(named: "defeat")
                winOrLossLabel.text = "Defeat"
            }
            killLabel.text = participantArray1[1].kills?.description
            deathsLabel.text = participantArray1[1].deaths?.description
            assistsLabel.text = participantArray1[1].assists?.description
            lastPlayedChampionImageView.image = UIImage(named: participantArray1[1].actor!)
        } else if player3.name == "TennantTheVast" {
            if participantArray1[2].winner?.description == "true" {
                matchImageView.image = UIImage(named: "victory")
                winOrLossLabel.text = "Victory"
            } else {
                matchImageView.image = UIImage(named: "defeat")
                winOrLossLabel.text = "Defeat"
            }
            killLabel.text = participantArray1[2].kills?.description
            deathsLabel.text = participantArray1[2].deaths?.description
            assistsLabel.text = participantArray1[2].assists?.description
            lastPlayedChampionImageView.image = UIImage(named: participantArray1[2].actor!)
        } else if player4.name == "TennantTheVast" {
            if participantArray2[0].winner?.description == "true" {
                matchImageView.image = UIImage(named: "victory")
                winOrLossLabel.text = "Victory"
            } else {
                matchImageView.image = UIImage(named: "defeat")
                winOrLossLabel.text = "Defeat"
            }
            killLabel.text = participantArray2[0].kills?.description
            deathsLabel.text = participantArray2[0].deaths?.description
            assistsLabel.text = participantArray2[0].assists?.description
            lastPlayedChampionImageView.image = UIImage(named: participantArray2[0].actor!)
        } else if player5.name == "TennantTheVast" {
            if participantArray2[1].winner?.description == "true" {
                matchImageView.image = UIImage(named: "victory")
                winOrLossLabel.text = "Victory"
            } else {
                matchImageView.image = UIImage(named: "defeat")
                winOrLossLabel.text = "Defeat"
            }
            killLabel.text = participantArray2[1].kills?.description
            deathsLabel.text = participantArray2[1].deaths?.description
            assistsLabel.text = participantArray2[1].assists?.description
            lastPlayedChampionImageView.image = UIImage(named: participantArray2[1].actor!)
        } else if player6.name == "TennantTheVast" {
            if participantArray2[2].winner?.description == "true" {
                matchImageView.image = UIImage(named: "victory")
                winOrLossLabel.text = "Victory"
            } else {
                matchImageView.image = UIImage(named: "defeat")
                winOrLossLabel.text = "Defeat"
            }
            killLabel.text = participantArray2[2].kills?.description
            deathsLabel.text = participantArray2[2].deaths?.description
            assistsLabel.text = participantArray2[2].assists?.description
            lastPlayedChampionImageView.image = UIImage(named: participantArray2[2].actor!)
        } else {
            print("There is an error going on here at line 172 in MatchesCell.swift")
        }
    }
    
}
