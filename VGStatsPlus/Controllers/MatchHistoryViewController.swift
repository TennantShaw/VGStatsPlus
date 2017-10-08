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
    @IBOutlet var matchHistoryTableView: UITableView!
    
    
    //MARK: - Properties
    var matchHistoryData: [Match] = []
    var matchDetails = VGDataSource.instance.selectedMatch {
        didSet {
            print("pulled match data")
        }
    }
    
    //MARK: - Class Methods
    func createArray() -> [Match] {
        var tempMatchHistoy: [Match] = []
        
        let match = Match(id: "", type: "Ranked", patchVersion: "", shardID: "", titleID: "", gameMode: "Standard", duration: 600, createdAt: "", queue: "", endGameReason: "Victory", assets: [], roster: [])
        
        tempMatchHistoy.append(match)
        
        return tempMatchHistoy
        // Will use this to pull in match data and assign to matchHistoryData
    }
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        VGDataSource.instance.matchDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        matchHistoryData = createArray()
    }

}


extension MatchHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: - Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //MARK: - DataSource Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = matchHistoryTableView.dequeueReusableCell(withIdentifier: "matchHistoryCell") as? MatchHistoryCell else { return UITableViewCell() }
        if VGDataSource.instance.matchDetails != nil {
           cell.setup(matchDetails: VGDataSource.instance.matchDetails!)
        }
        return cell
        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
