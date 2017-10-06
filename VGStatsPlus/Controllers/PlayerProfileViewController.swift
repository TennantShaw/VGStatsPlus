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
    
    @IBOutlet weak var tableView: UITableView!
    let imageView = UIImageView()
    //MARK: - Outlets
    @IBOutlet weak var mostPlayedCharacterImage: UIImageView!
    
    
    //MARK: - Actions
    @IBAction func goToMatchHistoryPageButton(_ sender: Any) {
        
    }
    
    
    //MARK: - Properties
    var player = VGDataSource.instance.player {
        didSet {
            print("Changed")
        }
    }
    
    
    //navigationItem.title = playerIGN // This will come from the json data. We will have to parse it out for this.
    var playerData: PlayerResource! {
        didSet {
            navigationItem.title = playerData.name
        }
    }
    
    var matchData: ParticipantResource!

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
        
    }
    
}


extension PlayerProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell") as? PlayerCell else  { return UITableViewCell() }
        if VGDataSource.instance.player != nil {
           cell.setup(player: VGDataSource.instance.player!)
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let y = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 400)
        
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: height)
    }
}
