//
//  TwitchHomeVC.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 11/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

class TwitchHomeVC: UIViewController {

    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var activitiyIndicator: UIActivityIndicatorView!
    @IBOutlet var backBtn: UIButton!
    var refreshController: UIRefreshControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        backBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        refreshController = UIRefreshControl()
        refreshController.addTarget(self, action: #selector(TwitchHomeVC.reloadData), for: .valueChanged)
        collectionView.insertSubview(refreshController, at: 0)
        
        reloadData()
    }

    @objc fileprivate func reloadData() {
        TwitchDataService.instance.downloadTopGames {
            for game in TwitchDataService.instance.games {
                game.downloadGameImage {
                    self.collectionView.reloadData()
                    self.activitiyIndicator.stopAnimating()
                    self.refreshController.endRefreshing()
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TwitchHomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TwitchDataService.instance.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as? TwitchCell else { return UICollectionViewCell() }
        
        cell.setup(game: TwitchDataService.instance.games[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width / 2) - 15
        let height = width * (4/3)
        return CGSize(width: width, height: height)
    }
}
