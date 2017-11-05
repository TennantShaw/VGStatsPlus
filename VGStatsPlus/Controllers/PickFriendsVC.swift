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
    
    var selectedFriends: [String:String] = [:] {
        didSet {
            if selectedFriends.count != 0 {
                doneBtn.isEnabled = true
            } else {
                doneBtn.isEnabled = false
            }
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
        if selectedFriends.count == 0 {
            doneBtn.isEnabled = false
        }
        VGFirebaseDB.instance.getAllFriendsIDs { (dictOfIDs) in
            self.dict = dictOfIDs
        }
    }
    
    @objc func tapToClose(_ gestureRecognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        if selectedFriends.count != 0 {
            channelFriendsDelegate.getSelectedFriends(selectedFriendsIDs: selectedFriends)
            dismiss(animated: true, completion: nil)
        }
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
        if selectedFriends[Array(dict.keys)[indexPath.row]] == nil {
           selectedFriends[Array(dict.keys)[indexPath.row]] = Array(dict.values)[indexPath.row]
           addedLabel.text = Array(selectedFriends.values).description
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if selectedFriends[Array(dict.keys)[indexPath.row]] != nil {
           selectedFriends[Array(dict.keys)[indexPath.row]] = nil
            if selectedFriends.count == 0 {
                addedLabel.text = "Add Friends"
            } else {
                addedLabel.text = String(describing: selectedFriends.values)
            }
        }
    }
}
