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

class CreateChannel: UIViewController {
    
    @IBOutlet weak var backgroundVIew: UIView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var channelImageView: CircleImage!
    @IBOutlet var createBtn: RoundedButton!
    @IBOutlet var descriptionTextField: UITextField!
    
    var delegate: ChannelVC!
    
    var avatarName: String = "dark0" {
        didSet {
            channelImageView.image = UIImage(named: avatarName)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRescognizer = UITapGestureRecognizer()
        gestureRescognizer.addTarget(self, action: #selector(CreateChannel.tapToClose(_:)))
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
    @IBAction func createBtnTapped(_ sender: Any) {
        if nameTextField.text != "" && descriptionTextField.text != "" {
            VGFirebaseDB.instance.createChannel(withTitle: nameTextField.text!, withDiscription: descriptionTextField.text!, channelImage: avatarName, handler: { (success) in
                if success {
                    self.dismiss(animated: true, completion: {
                        self.delegate.checkDatabase()
                    })
                } else {
                    
                }
            })
        }
    }
}

extension CreateChannel: GetSelectedAvatarImageDelegate {
    
    func getSelectedAvatarImage(selectedImageName: String) {
        avatarName = selectedImageName
    }
}
