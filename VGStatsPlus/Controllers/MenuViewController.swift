//
//  MenuViewController.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/7/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class MenuViewController: UIViewController {
    
    @IBOutlet var userProfileImage: CircleImage!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 50
        VGFirebaseDB.instance.getUserInfo(withID: SavedStatus.instance.userID) { (name, image) in
            self.userProfileImage.downloadedFrom(link: image)
            self.nameLabel.text = name
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    @IBAction func handleLogin(_ sender: Any) {
//        VGFirebaseDB.instance.logout()
//        SavedStatus.instance.isLoggedIn = false
    }
    
    @IBAction func goToIGNView(_ sender: Any) {
        performSegue(withIdentifier: "IGNSeq", sender: self)
    }
    
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath) as? AddCell else { return UITableViewCell() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "IGNCell", for: indexPath) as? IGNCell else { return UITableViewCell() }
            return cell
        }
    }
}

class AddCell: UITableViewCell {
    
    @IBAction func addBtnTapped(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}

class IGNCell: UITableViewCell {
    
    @IBOutlet var ignNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
