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
    //MARK: - Properties
    var matchHistoryData: [Match] = []
    
    
    //MARK: - Class Methods
    func createArray() -> [Match] {
        var tempMatchHistoy: [Match] = []
        
        let match = Match(id: "", type: "Ranked", patchVersion: "", shardID: "", titleID: "", gameMode: "Standard", duration: 600, createdAt: "", queue: "", endGameReason: "Victory", assets: [], roster: [])
        
        tempMatchHistoy.append(match)
        
        return tempMatchHistoy
        // Will use this to pull in match data and assign to matchHistoryData
    }
    
    
    //MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        matchHistoryData = createArray()
    }

}

//
//extension MatchHistoryViewController: UITableViewDelegate, UITableViewDataSource {
//    //MARK: - Delegate Methods
//    
//    
//    //MARK: - DataSource Methods
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let match = matchHistoryData[indexPath.row]
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "matchHistoryCell")
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return matchHistoryData.count
//    }
//}
