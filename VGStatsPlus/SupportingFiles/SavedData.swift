//
//  SavedData.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/7/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation


class SavedStatus {
    
    static let instance = SavedStatus()
    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: "loggedIn")
        }
        set {
            defaults.set(newValue, forKey: "loggedIn")
        }
    }
    
    var savedUserIGN: [String:Any] {
        get {
            return defaults.dictionary(forKey: "savedIGN")!
        }
        set {
            defaults.set(newValue, forKey: "savedIGN")
        }
    }
    
    var currentUserEmail: String {
        get {
            return defaults.value(forKey: "userEmail") as! String
        }
        set {
            defaults.set(newValue, forKey: "userEmail")
        }
    }
    
    var userID: String {
        get {
            return defaults.value(forKey: "userID") as! String
        }
        set {
            defaults.set(newValue, forKey: "userID")
        }
    }
    var userImageUrl: String {
        get {
            return defaults.value(forKey: "userImageUrl") as! String
        }
        set {
            defaults.set(newValue, forKey: "userImageUrl")
        }
    }
    
    var userName: String {
        get {
            return defaults.value(forKey: "userName") as! String
        }
        set {
            defaults.set(newValue, forKey: "userName")
        }
    }
    
}
