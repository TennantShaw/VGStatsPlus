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
    @IBOutlet var leftSideVictoryOrDefeatLabel: UILabel!
    @IBOutlet var rightSideAcesLabel: UILabel!
    @IBOutlet var rightSideKrakenKillsLabel: UILabel!
    @IBOutlet var rightSideTeamGoldLabel: UILabel!
    @IBOutlet var rightSideVictoryOrDefeatLabel: UILabel!
    
    @IBOutlet var leftSideTableView: UITableView!
    @IBOutlet var rightSideTableView: UITableView!
    
    //MARK: - Properties
    var matchResource: MatchResource?
    var participantResources = [String:[ParticipantResource]]()
    
    
    //MARK: = View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

}

extension MatchHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftSideTableView && VGDataSource.instance.participantResources["teamL"]?.count != 0 {
            guard let teamLParticipantCount = VGDataSource.instance.participantResources["teamL"]?.count else { return 0 }
            return teamLParticipantCount
        } else if tableView == rightSideTableView && VGDataSource.instance.participantResources["teamR"]?.count != 0 {
            guard let teamRParticipantCount = VGDataSource.instance.participantResources["teamR"]?.count else { return 0 }
            return teamRParticipantCount
        } else {
            return 0
        }
    }
    
    //MARK: - DataSource Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == leftSideTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftSideCell") as? LeftSideCell else { return UITableViewCell() }
            cell.setupCell(participant: (VGDataSource.instance.participantResources["teamL"]?[indexPath.row]))
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "rightSideCell") as? RightSideCell else { return UITableViewCell() }
            cell.setupCell(participant: (VGDataSource.instance.participantResources["teamR"]?[indexPath.row]))
            return cell
        }
    }
    
    
}

