//
//  PickFriendsVC.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 11/1/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

class PickFriendsVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var nameTextField: UITextField!
    
    
    var ids: [String] = [SavedStatus.instance.userID] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        VGFirebaseDB.instance.getAllFriendsIDs { (arrayOfIDs) in
            self.ids = arrayOfIDs
        }
    }
}

extension PickFriendsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ids.count != 0 {
            return ids.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as? SelectFriendCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = ids[indexPath.row]
        return cell
    }
}
