//
//  MenuViewController.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/7/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.width / 2
    }

    @IBAction func handleLogin(_ sender: Any) {
        
    }
}
