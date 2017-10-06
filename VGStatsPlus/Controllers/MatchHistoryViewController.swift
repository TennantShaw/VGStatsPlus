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
    var matchHistoryData: [MatchResource] = []
    
    
    //MARK: - Class Methods
    func createArray() -> [MatchResource] {
        var tempMatchHistoy: [MatchResource]
        
        // Will use this to pull in match data and assign to matchHistoryData
    }
    
    
    //MARK: - View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

//extension MatchHistoryViewController: UITableViewDelegate, UITableViewDataSource {
//    //MARK: - Delegate Methods
//    
//    
//    //MARK: - DataSource Methods
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//}
