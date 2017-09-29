//
//  PlayerProfileViewController.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 9/26/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import UIKit

class PlayerProfileViewController: UIViewController, UINavigationControllerDelegate {
    //MARK: - Properties
    var store: PlayerDataStore!
//    var playerProfile: String {
//        didSet {
//            //navigationItem.title = playerIGN // This will come from the json data. Will will have to parse it out for this.
//        }
//    }
    
    
    //MARK: - Initializers

    
    
    //MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        store.fetchPlayerData()
    }
    
    
    
}
