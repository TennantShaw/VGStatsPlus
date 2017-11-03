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
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var addedLabel: UILabel!
    @IBOutlet var doneBtn: UIButton!
    
    var channelFriendsDelegate: GetSelectedFriendsDelegate!
    
    var dict: [String:String] = [:] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let gestureRescognizer = UITapGestureRecognizer()
        gestureRescognizer.addTarget(self, action: #selector(PickFriendsVC.tapToClose(_:)))
        backgroundView.addGestureRecognizer(gestureRescognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        VGFirebaseDB.instance.getAllFriendsIDs { (dictOfIDs) in
            self.dict = dictOfIDs
        }
    }
    
    @objc func tapToClose(_ gestureRecognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        
    }
}

extension PickFriendsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dict.count != 0 {
            return dict.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as? SelectFriendCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = Array(dict.values)[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
