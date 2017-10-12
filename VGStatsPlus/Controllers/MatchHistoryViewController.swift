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
    
    //MARK: -
    var matchResource: MatchResource?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        
        // side menu setup
        revealViewController().rightViewRevealWidth = self.view.frame.width / 3
        super.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        super.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        revealViewController().rightViewRevealWidth = self.view.frame.width - 50

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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "redSideCell") as? MatchHistoryCell else { return UITableViewCell() }
        return cell
    }
}

