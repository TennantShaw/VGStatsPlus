//
//  PlayerProfileViewController.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 10/3/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import UIKit
import VaingloryAPI

class PlayerProfileViewController: UIViewController, UINavigationControllerDelegate {
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Properties
    let imageView = UIImageView()
    var indexNumber: Int?
    
    var matches: [MatchResource] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var player = VGDataSource.instance.player
    
    
    //MARK: - Initializers
    // default in use
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        VGDataSource.instance.delegate = self
        self.navigationController?.isNavigationBarHidden = true
        tableView.estimatedRowHeight = 50
        tableView.contentInset = UIEdgeInsetsMake(300, 0, 0, 0)
        tableView.backgroundColor = UIColor.clear
        
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
        imageView.image = UIImage(named: "Ardan_Splash")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        revealViewController().rightViewRevealWidth = self.view.frame.width - 50
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        
        checkStatus()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    //MARK: - Class Methods
    func checkStatus() {
        if SavedStatus.instance.isLoggedIn {
            var name: String = ""
            var region: String = ""
            
            let savedUserInfo = SavedStatus.instance.savedUserIGN
            for (_name,value) in savedUserInfo {
                name = _name as String
                region = value as! String
            }
            VGDataSource.instance.getUserData(name: name, regional: region, success: { (success) in
                VGFirebaseDB.instance.getIgnForTheUser(id: SavedStatus.instance.userID, gotIGN: { (succes, error) in
                    if success {
                        print(VGFirebaseDB.instance.playerIGN!)
                    }
                })
                self.tableView.reloadData()
            })
        }
    }
    
}

//MARK: - TableView DataSource and Delegate
extension PlayerProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell") as? PlayerCell else  { return UITableViewCell() }
            if VGDataSource.instance.player != nil {
                VGDataSource.instance.getMatches(regional: (VGDataSource.instance.player!.shardId)!, success: { (success) in
                    if success {
                        let matches = VGDataSource.instance.matches.sorted {
                            $0.createdAt! > $1.createdAt!
                        }
                        cell.setup(player: VGDataSource.instance.player!, match: matches[0])
                    }
                })
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "matchesCell") as? MatchesCell else  { return UITableViewCell() }
            if VGDataSource.instance.player != nil {
                VGDataSource.instance.getMatches(regional: (VGDataSource.instance.player?.shardId)!, success: { (success) in
                    if success {
                        let matches = VGDataSource.instance.matches.sorted {
                            $0.createdAt! > $1.createdAt!
                        }
                        
                        var createdAtSet = Set<MatchResource>()
                        var arrayOfMatches: [MatchResource] = []

                        for match in matches {
                            createdAtSet.insert(match)
                        }
                        
                        for createdDate in createdAtSet {
                            arrayOfMatches.append(createdDate)
                        }
                        
                        cell.matches = arrayOfMatches.sorted {
                            $0.createdAt! > $1.createdAt!
                        }
                    }
                })
            }
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return CGFloat(320)
        } else {
            return CGFloat(280)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let y = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 400)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height)
    }
    
    func uniqueElementsFrom(array: [String]) -> [String] {
        //Create an empty Set to track unique items
        var set = Set<String>()
        let result = array.filter {
            guard !set.contains($0) else {
                //If the set already contains this object, return false
                //so we skip it
                return false
            }
            //Add this item to the set since it will now be in the array
            set.insert($0)
            //Return true so that filtered array will contain this item.
            return true
        }
        return result
    }

    
}
