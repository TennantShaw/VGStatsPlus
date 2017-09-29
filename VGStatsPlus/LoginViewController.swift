//
//  LoginViewController.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 9/25/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    //MARK: - Outlets
    @IBOutlet var picker: UIPickerView!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var textFieldIGN: UITextField!
    
    
    //MARK: - Actions
    @IBAction func submitButton(_ sender: UIButton) {
    }
    
    @IBAction func IGNTextFieldChanged(_ sender: UITextField) {
        // This is were we will insert the player ign (In Game Name) to what ever we need to construct the GET request url
    }
    
    
    //MARK: - Properties
    var regionalShards = ["East Asia", "Europe", "Southeast Asia", "North America", "South America", "East Asia Tournament", "Europe Tournament", "Southeast Asia Tournament", "North America Tournament", "South America Tournament"]

    
    //MARK: Initializers
    //Default provided
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        textFieldIGN.delegate = self
//        store.fetchPlayerData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    //MARK: - PickerViewDataSource Methods
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return regionalShards.count
    }
    
    
    
    //MARK: - PickerViewDelegate Methods
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return regionalShards[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    //MARK: - TextField Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldIGN.resignFirstResponder()
        return true
    }
}
