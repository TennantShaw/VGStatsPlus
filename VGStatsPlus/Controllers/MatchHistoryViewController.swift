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
    
    @IBOutlet var matchNameLabel: UILabel!
    
    
    //MARK: - Properties
    var matchResource = VGDataSource.instance.selectedMatch
    var participantResources = [String:[ParticipantResource]]()

    
    //MARK: = View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
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
        
        if match!.gameMode == "ranked" {
            matchNameLabel.text = "Ranked"
        } else if match!.gameMode == "blitz_pvp_ranked" {
            matchNameLabel.text = "Blitz"
        } else if match!.gameMode == "casual_aral" {
            matchNameLabel.text = "Battale Royale"
        } else if match!.gameMode == "blitz_rounds_pvp_casual" {
            matchNameLabel.text = "Onslaught"
        } else {
            matchNameLabel.text = "need to add gameMode type to be recognized"
        }
    }
    
    func convertToTimePlayed(duration: Int) -> String {
        let minutes = duration/60
        let seconds = Double(duration).truncatingRemainder(dividingBy: 60)
        let formattedSeconds = Int(seconds)
        
        if formattedSeconds == 1 {
            let back = "\(minutes):0\(formattedSeconds)"
            return back
        } else if formattedSeconds == 2 {
            let back = "\(minutes):0\(formattedSeconds)"
            return back
        } else if formattedSeconds == 3 {
            let back = "\(minutes):0\(formattedSeconds)"
            return back
        } else if formattedSeconds == 4 {
            let back = "\(minutes):0\(formattedSeconds)"
            return back
        } else if formattedSeconds == 5 {
            let back = "\(minutes):0\(formattedSeconds)"
            return back
        } else if formattedSeconds == 6 {
            let back = "\(minutes):0\(formattedSeconds)"
            return back
        } else if formattedSeconds == 7 {
            let back = "\(minutes):0\(formattedSeconds)"
            return back
        } else if formattedSeconds == 8 {
            let back = "\(minutes):0\(formattedSeconds)"
            return back
        } else if formattedSeconds == 9 {
            let back = "\(minutes):0\(formattedSeconds)"
            return back
        } else {
            let back = "\(minutes):\(formattedSeconds)"
            return back
        }
    }

    @IBAction func backBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
            setupMatchHistory(match: matchResource)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "rightSideCell") as? RightSideCell else { return UITableViewCell() }
            cell.setupCell(participant: (VGDataSource.instance.participantResources["teamR"]?[indexPath.row]))
            setupMatchHistory(match: matchResource)
            return cell
        }
    }
    
    
}

