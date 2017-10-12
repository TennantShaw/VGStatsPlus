//
//  MatchHistoryViewController.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 10/6/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import UIKit
import VaingloryAPI

class MatchHistoryViewController: UIViewController, UINavigationControllerDelegate {
    //MARK: - Outlets
    @IBOutlet var timePlayedLabel: UILabel!
    @IBOutlet var leftSideAcesLabel: UILabel!
    @IBOutlet var leftSideKrakenKillsLabel: UILabel!
    @IBOutlet var leftSideTeamGoldLabel: UILabel!
    @IBOutlet var rightSideAcesLabel: UILabel!
    @IBOutlet var rightSideKrakenKillsLabel: UILabel!
    @IBOutlet var rightSideTeamGoldLabel: UILabel!
    @IBOutlet var leftSideVictoryOrDefeatLabel: UILabel!
    @IBOutlet var rightSideVictoryOrDefeatLabel: UILabel!
    
    //MARK: - Properties
    var matchResource: MatchResource?
    
    //MARK: = View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        
        // side menu setup // Taking out until I know why it is allowing to go to previous viewController while chat side menu is open
//        revealViewController().rightViewRevealWidth = self.view.frame.width / 3
//        self.view.addGestureRecognizer(super.revealViewController().panGestureRecognizer())
//        self.view.addGestureRecognizer(super.revealViewController().tapGestureRecognizer())
//
//        revealViewController().rightViewRevealWidth = self.view.frame.width - 50

    }
    


}


extension MatchHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //MARK: - DataSource Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftSideCell") as? MatchHistoryCell else { return UITableViewCell() }
        return cell
    }
}

