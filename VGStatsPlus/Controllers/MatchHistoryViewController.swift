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
    
    @IBOutlet var leftSideTableView: UITableView!
    @IBOutlet var rightSideTableView: UITableView!
    
    //MARK: - Properties
    var matchResource: MatchResource?
    var matches: [MatchResource] = [] {
        didSet {
            leftSideTableView.reloadData()
            rightSideTableView.reloadData()
        }
    }
    
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
        if tableView == leftSideTableView {
            return 3
        } else {
            return 3
        }
    }
    
    //MARK: - DataSource Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == leftSideTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "leftSideCell") as? LeftSideCell else { return UITableViewCell() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "rightSideCell") as? RightSideCell else { return UITableViewCell() }
            return cell
        }
    }
    
}

