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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMatchHistory(match: matchResource)
    }

    func setupMatchHistory(match: MatchResource?) {
        guard match != nil else { return }
        let leftRoster = match!.rosters![0]
        let rightRoster = match!.rosters![1]
        let leftPlayer = leftRoster.participants![0]
        let rightPlayer = rightRoster.participants![0]
        
        timePlayedLabel.text = convertToTimePlayed(duration: match!.duration!)
        leftSideAcesLabel.text = leftRoster.acesEarned?.description
        leftSideKrakenKillsLabel.text = leftRoster.krakenCaptures?.description
        leftSideAcesLabel.text = leftRoster.acesEarned?.description
        leftSideTeamGoldLabel.text = leftRoster.gold?.description
        
        if leftPlayer.winner?.description == "true" {
            leftSideVictoryOrDefeatLabel.text = "Victory"
        } else {
            leftSideVictoryOrDefeatLabel.text = "Defeat"
        }
        
        rightSideAcesLabel.text = rightRoster.acesEarned?.description
        rightSideKrakenKillsLabel.text = rightRoster.krakenCaptures?.description
        rightSideAcesLabel.text = rightRoster.acesEarned?.description
        rightSideTeamGoldLabel.text = rightRoster.gold?.description
        
        if rightPlayer.winner?.description == "true" {
            rightSideVictoryOrDefeatLabel.text = "Victory"
        } else {
            rightSideVictoryOrDefeatLabel.text = "Defeat"
        }
    }
    
    func convertToTimePlayed(duration: Int) -> String {
        let minutes = duration/60
        var seconds = Double(duration).truncatingRemainder(dividingBy: 60)
        let formattedSeconds = Int(seconds)
        
        let back = "\(minutes):\(formattedSeconds)"
        return back
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
            setupMatchHistory(match: (VGDataSource.instance.selectedMatch))
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "rightSideCell") as? RightSideCell else { return UITableViewCell() }
            cell.setupCell(participant: (VGDataSource.instance.participantResources["teamR"]?[indexPath.row]))
            setupMatchHistory(match: (VGDataSource.instance.selectedMatch))
            return cell
        }
    }
    
    
}

