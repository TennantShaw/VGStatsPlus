//
//  LoginViewController.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 10/3/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import UIKit
import VaingloryAPI

class LoginViewController: UIViewController, UITextFieldDelegate {
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
        let name = playerName
        let region = playerRegionShard
        if textFieldIGN.text != "" { VGDataSource.instance.getUserData(name: "TennantTheVast", regional: "na", success: { (success) in
            if success {
                print("successFully got data")
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let swVC = storyBoard.instantiateViewController(withIdentifier: "SWVC") as! UIViewController
                self.present(swVC, animated: true, completion: {
                    SavedStatus.instance.isLoggedIn = true
                })
            }
        })
        } else {
            // let user know that they cannot submit until they have added an IGN and selected a server region
            VGDataSource.instance.getUserData(name: "TennantTheVast", regional: "na", success: { (success) in
                if success {
                    print("successFully got data")
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let swVC = storyBoard.instantiateViewController(withIdentifier: "SWVC") as! UIViewController
                    self.present(swVC, animated: true, completion: {
                        SavedStatus.instance.isLoggedIn = true
                        SavedStatus.instance.savedUserIGN = ["TennantTheVast": "na"]
                    })
                }
            })
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
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(LoginViewController.dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        regionShardTextField.inputAccessoryView = toolbar
    }
    
    
    //MARK: - Class methods
    func dismissKeyboard() {
        view.endEditing(true)
    }
}



extension LoginViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
