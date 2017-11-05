//
//  CreateChannel.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/13/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

protocol GetSelectedAvatarImageDelegate {
    func getSelectedAvatarImage(selectedImageName: String)
}

protocol GetSelectedFriendsDelegate {
    func getSelectedFriends(selectedFriendsIDs: [String:String])
}

class CreateChannel: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var backgroundVIew: UIView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var channelImageView: CircleImage!
    @IBOutlet var createBtn: RoundedButton!
    
    var delegate: ChannelVC!
    
    var selectedFriends: [String:String] = [:]
    var avatarName: String = "dark0" {
        didSet {
            channelImageView.image = UIImage(named: avatarName)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        
        let str = NSAttributedString(string: "name", attributes: [NSForegroundColorAttributeName:UIColor.white])
        nameTextField.attributedPlaceholder = str
        
        let gestureRescognizer = UITapGestureRecognizer()
        gestureRescognizer.addTarget(self, action: #selector(CreateChannel.tapToClose(_:)))
        self.view.bindToKeyboard()
        backgroundVIew.addGestureRecognizer(gestureRescognizer)
    }

    @objc func tapToClose(_ gestureRecognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chooseImageBtnTapped(_ sender: Any) {
        // pickAvatarVC
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let avatarVC = storyBoard.instantiateViewController(withIdentifier: "pickAvatarVC") as! PickAvatarVC
        avatarVC.avatarNameDelegate = self
        self.present(avatarVC, animated: true, completion: nil)
    }
    
    //MARK: Create Channel Btn 
    @IBAction func createBtnTapped(_ sender: Any) {
        if nameTextField.text != "" && selectedFriends.count != 0 {
            VGFirebaseDB.instance.createChannel(withTitle: nameTextField.text!, withId: SavedStatus.instance.userID, channelImage: avatarName, friendsUID: selectedFriends, handler: { (success) in
                if success {
                    self.dismiss(animated: true, completion: {
                        self.delegate.checkDatabase()
                    })
                } else {
                    
                }
            })
        }
    }
    
    //MARK: Select Friends for the Channel
    @IBAction func selectFriendBtnTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let friendsVC = storyBoard.instantiateViewController(withIdentifier: "pickFriendsVC") as! PickFriendsVC
        friendsVC.channelFriendsDelegate = self
        self.present(friendsVC, animated: true, completion: nil)
    }
    
}

extension CreateChannel: GetSelectedAvatarImageDelegate, GetSelectedFriendsDelegate {
    
    func getSelectedAvatarImage(selectedImageName: String) {
        avatarName = selectedImageName
    }
    
    func getSelectedFriends(selectedFriendsIDs: [String:String]) {
        selectedFriends = selectedFriendsIDs
    }
}
