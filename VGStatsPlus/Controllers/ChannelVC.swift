//
//  ChannelVC.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var keyboardView: UIView!
    
    var channels: [Channel] = [] {
        didSet {
            print(channels.count)
            tableView.reloadData()
            collectionView.reloadData()
        }
    }
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        keyboardView.bindToKeyboard()
        self.revealViewController().rearViewRevealWidth = self.view.frame.width / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Mark: Pull Channels
        checkDatabase()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func checkDatabase() {
        VGFirebaseDB.instance.getAllChannels { (channels) in
            self.channels = channels
        }
    }
}

extension ChannelVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if channels.count != 0 {
            return channels.count + 1
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addCell", for: indexPath)
            cell.layer.cornerRadius = 10.0
            return cell
        } else {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "channelCell", for: indexPath) as? ChannelCell else {
            return UICollectionViewCell()
        }
        cell.channelNameLabel.text = "TEST"
        return cell
      }
    }
    
    func tapToClose(_ gestureRecognizer: UIGestureRecognizer) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        if indexPath.row == 0 {
            let createChannelVC = CreateChannel()
            createChannelVC.modalPresentationStyle = .custom
            // createChannelVC.delegate = self
            self.present(createChannelVC, animated: true, completion: nil)
        }
    }
}

extension ChannelVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "channelMessageCell") as? ChannelMessageCell else {
                return UITableViewCell()
            }
            cell.setup()
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
