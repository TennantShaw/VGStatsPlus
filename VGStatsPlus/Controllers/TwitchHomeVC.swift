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
//        TwitchDataService.instance.downloadTopGames {
//            for game in TwitchDataService.instance.games {
//                game.downloadGameImage {
//                    self.collectionView.reloadData()
//                    self.activitiyIndicator.stopAnimating()
//                    self.refreshController.endRefreshing()
//                }
//            }
//        }
        
        TwitchDataService.instance.downloadStreams {
            for stream in TwitchDataService.instance.streams {
                stream.downloadStreamImage {
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
    
    func openStream(_ stream: Stream) {
        let alert = UIAlertController(title: "Open stream in VGStatsPlus or in official Twitch app?", message: "Official Twitch app must be installed for latter option.", preferredStyle: .alert)
        
        let openInVirerTwitchAction = UIAlertAction(title: "VGStatsPlus", style: .default) { (action) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "twitchChannelVC") as! TwitchChannelVC
            destinationVC.stream = stream
            self.present(destinationVC, animated: true, completion: nil)
        }
        
        let openinTwitchAppAction = UIAlertAction(title: "Twitch", style: .default) { (action) in
            self.openStreamInTwitchApp(stream)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:  nil)
        
        alert.addAction(openInVirerTwitchAction)
        alert.addAction(openinTwitchAppAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func openStreamInTwitchApp(_ stream: Stream) {
        let streamString = TWITCH_URL_STREAM_DEEP_LINK + stream.broadcasterName
        
        if let streamUrl = URL(string: streamString) {
            if UIApplication.shared.canOpenURL(streamUrl) {
                UIApplication.shared.open(streamUrl, options: [:], completionHandler: nil)
            }
        }
    }

}

extension TwitchHomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TwitchDataService.instance.streams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as? TwitchCell else { return UICollectionViewCell() }
        
        cell.setup(stream: TwitchDataService.instance.streams[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let stream = TwitchDataService.instance.streams[indexPath.row]
        openStream(stream)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width) - 15
        let height = collectionView.bounds.height / 2
        return CGSize(width: width, height: height)
    }
}
