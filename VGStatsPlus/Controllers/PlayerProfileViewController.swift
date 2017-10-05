//
//  PlayerProfileViewController.swift
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
    @IBOutlet var mostPlayedCharacterImage: UIImageView!
    @IBOutlet var playerRankImage: UIImageView!
    @IBOutlet var playerRankTextField: UITextField!
    @IBOutlet weak var standardCasualTextField: UITextField!
    @IBOutlet weak var standardRankedTextField: UITextField!
    @IBOutlet weak var blitzTextField: UITextField!
    @IBOutlet weak var battleRoyaleTextField: UITextField!
    
    
    //MARK: - Actions
    @IBAction func goToMatchHistoryPageButton(_ sender: Any) {
        
    }
    
    
    //MARK: - Properties
    //navigationItem.title = playerIGN // This will come from the json data. We will have to parse it out for this.
    var playerData: PlayerResource! {
        didSet {
            navigationItem.title = playerData.name
        }
    }
    
    var matchData: ParticipantResource!

    
    //MARK: - Initializers
    // default in use
    
    
    //MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mostPlayedCharacterImage.image = UIImage(named: "Joule_Splash")
        playerRankImage.image = UIImage(named: "tier_10c")
    }
    
}
