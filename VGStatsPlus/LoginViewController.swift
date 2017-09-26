//
//  LoginViewController.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 9/25/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    //MARK: - Outlets
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var textFieldIGN: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    
    //MARK: - Actions
    @IBAction func submitButton(_ sender: UIButton) {
    }
    
    
    //MARK: - Properties
    var regionalShards = ["East Asia", "Europe", "Southeast Asia", "North America", "South America", "East Asia Tournament", "Europe Tournament", "Southeast Asia Tournament", "North America Tournament", "South America Tournament"]
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
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
}
