//
//  FirebaseDatabase.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import Firebase

// Root to Firebase database
let DB_BASE = Database.database().reference()

class FirebaseDatabase {
    
    static let instance = FirebaseDatabase()
    // References
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    
    var currentuserID: String?

    
    
    // MARK: register user
    func registerUserToFirebase(withEmail email: String, password: String, name: String, accountType: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print("\(error.debugDescription)")
                userCreationComplete(false, nil)
            } else {
                let userData = ["provider": user?.providerID, "email": user?.email, "name": name, "createdAccountWith": accountType]
                FirebaseDatabase.instance.createDBUser(uid: (user?.uid)!, userData: userData)
                SavedStatus.instance.isLoggedIn = true
                SavedStatus.instance.userID = (user?.uid)!
                userCreationComplete(true, error)
            }
        }
    }
    
    // MARK: login to Firebase
    func loginUserToFirebase(withEmail email: String, password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if Auth.auth().currentUser?.email == email {
                print("Successfully logged in")
                SavedStatus.instance.isLoggedIn = true
                SavedStatus.instance.userID = (user?.uid)!
                SavedStatus.instance.currentUserEmail = (user?.email)!
                self.currentuserID = Auth.auth().currentUser?.uid
                loginComplete(true, nil)
            } else {
                loginComplete(false, error)
            }
        }
    }
    
    func logout() {
        
        do{
            try Auth.auth().signOut()
            SavedStatus.instance.isLoggedIn = false
        }catch{
            print("Error while signing out!")
        }
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func updateIGN(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).child("ign").updateChildValues(userData)
    }
}
