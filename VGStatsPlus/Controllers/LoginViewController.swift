//
//  Controller:LoginViewController.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 10/3/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import UIKit
import VaingloryAPI

class LoginViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    //MARK: - Outlets
    @IBOutlet var picker: UIPickerView!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var textFieldIGN: UITextField!
    
    
    //MARK: - Actions
    @IBAction func submitButton(_ sender: UIButton) {
        if textFieldIGN.text != "" { VGDataSource.instance.getUserData(name: "TennantTheVast", regional: "na", success: { (success) in
            if success {
                print("successFully got data")
            }
        })
        } else {
            // let user know that they cannot submit until they have added an IGN and selected a server region
        }
        
        let filters = RouterFilters()
            .playerName(textFieldIGN.text!)
            .limit(5)

        vainGloryAPI.getMatches(shard: Shard(rawValue: playerRegionShard!)!, filters: filters) { matches, error in
            if let matches = matches {
                for match in matches {
                    print("[VaingloryAPI] \(match)")
                }
            } else if let error = error {
                    print("[VaingloryAPI] \(error)")
                }
            }
            
        }
    
    
    @IBAction func IGNTextFieldChanged(_ sender: UITextField) {
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textFieldIGN.resignFirstResponder()
    }
    
    
    //MARK: - Properties
    var regionalShards = ["ea", "eu", "sg", "na", "sa"] // does not include tournament shards at this time
    
    var playerName: String?
    var playerRegionShard: String?
    
    
    //MARK: Initializers
    //Default provided
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        textFieldIGN.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    //MARK: - PickerViewDataSource Methods
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return regionalShards.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    //MARK: - PickerViewDelegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return regionalShards[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        playerRegionShard = regionalShards[row]
    }
    
    
    
    //MARK: - TextField Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        playerName = textFieldIGN.text
        textFieldIGN.resignFirstResponder()
        return true
    }
    
}
