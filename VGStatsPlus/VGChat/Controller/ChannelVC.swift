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
    
    // View outlets
    @IBOutlet var keyboardView: UIView!
    @IBOutlet var backView: UIView!
    @IBOutlet var channelMenuView: UIView!

    // Other outlets
    @IBOutlet var contentTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var swipeGestureRecognizer: UISwipeGestureRecognizer!
    @IBOutlet var leftArrowbtn: UIButton!
    @IBOutlet var blurEffect: UIVisualEffectView!
    
    
    // ChannelMenuViewOutlets
    @IBOutlet var channelImage: CircleImage!
    @IBOutlet var channelNameLabel: UILabel!
    @IBOutlet var channelAdminNameLabel: UILabel!
    
    
    
    var isShowingChannelMenu = false
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
    
    var messages: [Message] = []
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        
        view.bindToKeyboard()
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 50
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ChannelVC.handleSwipe(_:)))
        swipeLeft.direction = .left
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ChannelVC.handleSwipe(_:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeLeft)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Mark: Pull Channels
        self.backView.isHidden = true
        checkDatabase()
        
        let gestureRescognizer = UITapGestureRecognizer()
        gestureRescognizer.addTarget(self, action: #selector(ChannelVC.tapToEnd(_:)))
        self.tableView.addGestureRecognizer(gestureRescognizer)
        channelMenuView.addGestureRecognizer(gestureRescognizer)
        VGFirebaseDB.instance.REF_CHANNELS.observe(.value, with: { (snapshot) in
            self.checkDatabase()
            
        })
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @objc func handleSwipe(_ gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case .left:
                handleLeftSlide()
            case .right:
                handleRightSlide()
            default:
                print("")
            }
        }
    }
    
    @IBAction func leftBtnTapped(_ sender: Any) {
        handleLeftSlide()
    }
    
    
    func checkDatabase() {
        VGFirebaseDB.instance.getAllChannels { (channels) in
            self.channels = channels
            if self.channels.count != 0 {
                VGFirebaseDB.instance.getMessages(forChannel: VGFirebaseDB.instance.selectedChannel!, handler: { (messagesArray) in
                    self.messages = messagesArray
                    if self.messages.count != 0 {
                        self.tableView.reloadData()
                        self.tableView.scrollToRow(at: IndexPath(row: self.messages.count - 1, section: 0 ), at: .none, animated: true)
                    }
                })                
            }
        }
    }
    
    @objc func tapToEnd(_ gestureRecognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func matchesButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let friendsVC = storyBoard.instantiateViewController(withIdentifier: "selectMatchVC") as! SelectMatchVC
        friendsVC.delegate = self
        self.present(friendsVC, animated: true, completion: nil)
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        if contentTextField.text != "" {
            sendButton.isEnabled = true
            VGFirebaseDB.instance.sendMessage(withContent: contentTextField.text!, userID: VGFirebaseDB.instance.currentuserID!, channelID: (VGFirebaseDB.instance.selectedChannel?.channelID)!, handler: { (success) in
                if success {
                    self.contentTextField.text = ""
                    self.view.endEditing(true)
                }
            })
        } else {
            sendButton.isEnabled = false
        }
    }
    
    // Mark: Handling slide to left
    fileprivate func handleLeftSlide() {
        //Show ChannelMenuView
        self.channelMenuView.bounds.size.width = self.view.bounds.width - 60
        self.channelMenuView.bounds.size.height = self.view.bounds.height / 2
        self.channelMenuView.center = CGPoint(x: 400, y: 370.0)
        self.view.addSubview(self.channelMenuView)
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            self.channelMenuView.transform = CGAffineTransform(translationX: -190, y: 0)
            self.leftArrowbtn.layer.opacity = 0
            if VGFirebaseDB.instance.selectedChannel != nil {
                self.channelImage.image = UIImage(named: (VGFirebaseDB.instance.selectedChannel?.channelImage)!)
                self.channelNameLabel.text = VGFirebaseDB.instance.selectedChannel?.channelTitle
                
            }
        }, completion: { (success) in
            self.isShowingChannelMenu = true
        })
    }
    
    // Handling slide to right
    fileprivate func handleRightSlide() {
        if isShowingChannelMenu {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                self.channelMenuView.transform = CGAffineTransform(translationX: 190, y: 0)
                self.leftArrowbtn.layer.opacity = 1
                self.isShowingChannelMenu = false
                self.leftArrowbtn.isHidden = false
            }, completion: { (success) in
            })
        }
    }
    
    
    //Mark: ChannelMenuView action outlets
    
    @IBAction func groupMembersTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let friendsVC = storyBoard.instantiateViewController(withIdentifier: "pickFriendsVC") as! PickFriendsVC
        self.present(friendsVC, animated: true, completion: nil)
    }
    
    @IBAction func quitChannelTapped(_ sender: Any) {
        VGFirebaseDB.instance.quitChannel((VGFirebaseDB.instance.selectedChannel?.channelID)!)
        messages.removeAll()
        tableView.reloadData()
        handleRightSlide()
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
      channelMenuView.removeFromSuperview()
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
                self.tableView.reloadData()
                if self.messages.count != 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: self.messages.count - 1, section: 0 ), at: .none, animated: true)
                }
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
        if messages.count != 0 {
            cell.setup(message: messages[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
