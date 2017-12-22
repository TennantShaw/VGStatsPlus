//
//  InitialIGNVC.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 10/3/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import UIKit
import VaingloryAPI


class InitialIGNVC: UIViewController, UITextFieldDelegate {
    //MARK: - Outlets
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var textFieldIGN: UITextField!
    @IBOutlet var regionShardTextField: UITextField!
    
    
    //MARK: Needs fixing
    
    //MARK: - Properties
    var regionalShards = ["ea", "eu", "sg", "na", "sa"] // does not include tournament shards at this time
    
    var playerName: String?
    var playerRegionShard: String?
    
    //MARK: - Actions
    @IBAction func submitButton(_ sender: UIButton) {
        guard let name = playerName else { return }
        guard let region = playerRegionShard else { return }
        
        if textFieldIGN.text != "" { VGDataSource.instance.getUserData(name: name, regional: region, success: { (success) in
            if success {
                print("successFully got data")
                VGFirebaseDB.instance.updateIGN(userData: ["ign":name, "shardID": region])
                SavedStatus.instance.savedUserIGN = [name:region]
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let swVC = storyBoard.instantiateViewController(withIdentifier: "SWVC")
                self.present(swVC, animated: true, completion: {
                    SavedStatus.instance.isLoggedIn = true
                    SavedStatus.instance.savedUserIGN = [name:region]
                })
            } // may need to write code here to let me display error message to user.
        })
        } else {
            // let user know that they cannot submit until they have added an IGN and selected a server region
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let popUpVC = storyBoard.instantiateViewController(withIdentifier: "PopUpVC")
            self.present(popUpVC, animated: true, completion: nil)
        }
    }

    @IBAction func IGNTextFieldChanged(_ sender: UITextField) {
    }
    
    @IBAction func dismissKeyboardGesture(_ sender: UITapGestureRecognizer) {
        textFieldIGN.resignFirstResponder()
    }
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldIGN.delegate = self
        createRegionShardPicker()
        createToolbar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    //MARK: - TextField Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        playerName = textFieldIGN.text
        textFieldIGN.resignFirstResponder()
        return true
    }
    
    
    //MARK: - Create UIPickerView Method
    func createRegionShardPicker() {
        let regionShardPicker = UIPickerView()
        regionShardPicker.delegate = self
        
        //Customizations
        regionShardPicker.backgroundColor = .black
        
        regionShardTextField.inputView = regionShardPicker
    }
    
    
    //MARK: - Create toolbar Method
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //Customizations
        toolbar.barTintColor = .black
        toolbar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(InitialIGNVC.dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        regionShardTextField.inputAccessoryView = toolbar
    }
    
    
    //MARK: - Class methods
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}



extension InitialIGNVC: UIPickerViewDelegate, UIPickerViewDataSource {
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
        regionShardTextField.text = playerRegionShard
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Menlo-Regular", size: 17)
        
        label.text = regionalShards[row]
        
        return label
    }
    
}
