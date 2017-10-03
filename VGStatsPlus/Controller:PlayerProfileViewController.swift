//
//  Controller:PlayerProfileViewController.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 10/3/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import UIKit
import VaingloryAPI

class PlayerProfileViewController: UIViewController, UINavigationControllerDelegate {
    //MARK: - Outlets
    @IBOutlet weak var mostPlayedCharacterImage: UIImageView!
    
    
    //MARK: - Actions
    @IBAction func goToMatchHistoryPageButton(_ sender: Any) {
    }
    
    
    //MARK: - Properties
    //navigationItem.title = playerIGN // This will come from the json data. Will will have to parse it out for this.
    var playerData: PlayerResource!
    var matchData: ParticipantResource!
    
    //MARK: - Initializers
    // default in use
    
    
    //MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        store.fetchPlayerData()
    }
    
}
