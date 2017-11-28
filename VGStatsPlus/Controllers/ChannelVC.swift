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
    @IBOutlet var contentTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var backView: UIView!
    
    
    var channels: [Channel] = [] {
        didSet {
            if channels.count != 0 {
                VGFirebaseDB.instance.getMessages(forChannel: channels[0]) { (messageArray) in
                self.messages = messageArray
                }
            }
            collectionView.reloadData()
        }
    }
    
    var messages: [Message] = [] {
        didSet {
            tableView.reloadData()
            if messages.count != 0 {
                tableView.scrollToRow(at: IndexPath(row: self.messages.count - 1, section: 0) , at: .none, animated: true)
            }
        }
    }
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        view.bindToKeyboard()
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 50
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Mark: Pull Channels
        self.backView.isHidden = true
        checkDatabase()
        
        let gestureRescognizer = UITapGestureRecognizer()
        gestureRescognizer.addTarget(self, action: #selector(ChannelVC.tapToEnd(_:)))
        self.tableView.addGestureRecognizer(gestureRescognizer)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func checkDatabase() {
        VGFirebaseDB.instance.getAllChannels { (channels) in
            self.channels = channels
            if self.channels.count != 0 {
                VGFirebaseDB.instance.getMessages(forChannel: self.channels.first!, handler: { (messagesArray) in
                    self.messages = messagesArray
                })                
            }
        }
    }
    
    @objc func tapToEnd(_ gestureRecognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func matchesButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        if contentTextField.text != "" {
            sendButton.isEnabled = true
            VGFirebaseDB.instance.sendMessage(withContent: contentTextField.text!, userID: VGFirebaseDB.instance.currentuserID!, channelID: (VGFirebaseDB.instance.selectedChannel?.channelID)!, handler: { (success) in
                if success {
                    self.contentTextField.text = ""
                    VGFirebaseDB.instance.getMessages(forChannel: VGFirebaseDB.instance.selectedChannel!, handler: { (messagesArray) in
                        self.messages = messagesArray
                        self.view.endEditing(true)
                        self.tableView.reloadData()
                    })
                }
            })
        } else {
            sendButton.isEnabled = false
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
        cell.setupCell(channel: channels[indexPath.row - 1])
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
            createChannelVC.delegate = self
            self.present(createChannelVC, animated: true, completion: nil)
            self.backView.isHidden = false
        } else {
            VGFirebaseDB.instance.selectedChannel = channels[indexPath.row - 1]
            VGFirebaseDB.instance.getMessages(forChannel: channels[indexPath.row - 1], handler: { (messagesArray) in
                self.messages = messagesArray
            })
        }
    }
}

extension ChannelVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if messages.count != 0 {
            return messages.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "channelMessageCell") as? ChannelMessageCell else {
                return UITableViewCell()
            }
            cell.setup(message: messages[indexPath.row])
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
