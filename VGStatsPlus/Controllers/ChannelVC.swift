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
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        keyboardView.bindToKeyboard()
        
        let gestureRescognizer = UITapGestureRecognizer()
        gestureRescognizer.addTarget(self, action: #selector(ChannelVC.dismissKeyboard))
        view.addGestureRecognizer(gestureRescognizer)
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.width / 2
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension ChannelVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addCell", for: indexPath)
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
}
