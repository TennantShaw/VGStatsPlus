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
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 50
    }

    @IBAction func handleLogin(_ sender: Any) {
//        VGFirebaseDB.instance.logout()
//        SavedStatus.instance.isLoggedIn = false
    }
}
