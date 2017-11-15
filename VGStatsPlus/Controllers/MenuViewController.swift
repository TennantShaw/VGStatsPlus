//
//  MenuViewController.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/7/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import Firebase

class MenuViewController: UIViewController {
    
    @IBOutlet var userProfileImage: CircleImage!
    @IBOutlet var nameLabel: UILabel!
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 50
        VGFirebaseDB.instance.getUserInfo(withID: SavedStatus.instance.userID) { (name, image) in
          //  self.userImageView.downloadedFrom(link: image)
        }
    }

    @IBAction func handleLogin(_ sender: Any) {
//        VGFirebaseDB.instance.logout()
//        SavedStatus.instance.isLoggedIn = false
    }
}
