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

class VGFirebaseDB {
    
    static let instance = VGFirebaseDB()
    // References

    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_CHANNELS = DB_BASE.child("channels")
    private var _REF_FEED = DB_BASE.child("feed")

    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_CHANNELS: DatabaseReference {
        return _REF_CHANNELS
    }
    
    var REF_FEED: DatabaseReference {
        return _REF_FEED
    }
    
    
    var currentuserID: String?
    var channelsArray: [Channel] = [] {
        didSet {
            print(channelsArray.count)
        }
    }
    
    
    // MARK: register user
    func registerUserToFirebase(withEmail email: String, password: String, name: String, accountType: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print("\(error.debugDescription)")
                userCreationComplete(false, nil)
            } else {
                let userData = ["provider": user?.providerID, "email": user?.email, "name": name, "createdAccountWith": accountType]
                SavedStatus.instance.userID = (user?.uid)!
                SavedStatus.instance.isLoggedIn = true
                VGFirebaseDB.instance.createDBUser(name: name, userData: userData)
                userCreationComplete(true, error)
            }
        }
    }
    
    
    // MARK: login to Firebase
    func loginUserToFirebase(withEmail email: String, password: String, loginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email.lowercased(), password: password) { (user, error) in
            guard let currentEmail = Auth.auth().currentUser?.email else { return }
            if currentEmail == email.lowercased() {
                print("Successfully logged in")
                SavedStatus.instance.isLoggedIn = true
                if user?.uid != nil {
                SavedStatus.instance.userID = (user?.uid)!
                SavedStatus.instance.currentUserEmail = currentEmail
                self.currentuserID = Auth.auth().currentUser?.uid
                loginComplete(true, nil)
                } else {
                    loginComplete(false, error)
                }
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
    
    func createDBUser(name: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(SavedStatus.instance.userID).child(name).updateChildValues(userData)
    }
    
    func updateIGN(userData: Dictionary<String, Any>) {
        REF_USERS.child(SavedStatus.instance.userID).child("ign").updateChildValues(userData)
    }
    
    
    // MARK: Create a Channel
    
    func createChannel(withTitle title: String, withDiscription description: String, channelImage image: String, handler: @escaping (_ groupCreated: Bool) -> ()) {
        REF_CHANNELS.childByAutoId().updateChildValues(["title": title, "description": description, "image": image])
        handler(true)
    }
    
    func getAllChannels(handler: @escaping (_ messages: [Channel]) -> ()) {
        var channelArray = [Channel]()
        REF_CHANNELS.observeSingleEvent(of: .value, with: { (snap) in
            guard let channelSnap = snap.children.allObjects as? [DataSnapshot] else { return }
            for channel in channelSnap {
                let title = channel.childSnapshot(forPath: "title").value as! String
                let desc = channel.childSnapshot(forPath: "description").value as! String
                let channelImage = channel.childSnapshot(forPath: "image").value as! String
                let _channel = Channel(channelTitle: title, channelDesc: desc, channelImage: channelImage)
                channelArray.append(_channel)
            }
            handler(channelArray)
        })
    }
}
