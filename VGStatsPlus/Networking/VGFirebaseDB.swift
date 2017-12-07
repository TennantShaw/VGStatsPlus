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
    private var _REF_USER_IGN = DB_BASE.child("userIGNInfo")
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
    
    var REF_USER_IGN: DatabaseReference {
        return _REF_USER_IGN
    }
    
    
    var currentuserID: String?
    var selectedChannel: Channel?
    var playerIGN: String?
    var friendsIGNs: [String]?
    
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
    
    
    // Get User Profile pic
    func getUserInfo(withID id: String, success: @escaping (_ name: String, _ imageUrl: String) -> ()) {
        REF_USERS.child(id).observe(.value, with: { (snap) in
            guard let userSnap = snap.children.allObjects as? [DataSnapshot] else { return }
            for userInfo in userSnap {
                let userName = userInfo.key
                guard let imageUrl = userInfo.childSnapshot(forPath: "picture").childSnapshot(forPath: "data").childSnapshot(forPath: "url").value as? String else { return }
                success(userName, imageUrl)
            }
        })
    }
    
    // Update User with id
    func updateUserChannels(withID id: String, channel: [String:Any], success: @escaping (_ updated: Bool) -> ()) {
        REF_USERS.child(id).child("channels").updateChildValues(channel)
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
        REF_USERS.child(SavedStatus.instance.userID).child("userIGNInfo").updateChildValues(userData)
        getIgnForTheUser(id: SavedStatus.instance.userID) { (success, error) in
            print(success)
        }
    }
    
    
    // MARK: Create a Channel
    
    func createChannel(withTitle title: String, withId id: String, channelImage image: String, friendsUID uid: [String:String], handler: @escaping (_ groupCreated: Bool) -> ()) {
        let channelID = UUID()
        REF_CHANNELS.child("\(channelID)").updateChildValues(["title": title, "admin": SavedStatus.instance.userID, "image": image, "id": id, "friends": uid])
        for id in uid {
            updateUserChannels(withID: id.key, channel: [title : "\(channelID)"], success: { (success) in
                print("ChannelUpdated")
            })
        }
        handler(true)
    }
    
    func getIgnForTheUser(id: String, gotIGN: @escaping (_ success: Bool, _ error: Error?) -> ()) {
        REF_USERS.child(id).child("userIGNInfo").observeSingleEvent(of: .value, with: { (ignSnap) in
            self.playerIGN = ignSnap.childSnapshot(forPath: "ign").value as? String
            gotIGN(true, nil)
        })
        
    }
    
    func getAllChannels(handler: @escaping (_ messages: [Channel]) -> ()) {
        var channelArray = [Channel]()
        REF_CHANNELS.observeSingleEvent(of: .value, with: { (snap) in
            guard let channelSnap = snap.children.allObjects as? [DataSnapshot] else { return }
            for channel in channelSnap {
                if channel.childSnapshot(forPath: "admin").value as! String == SavedStatus.instance.userID || channel.childSnapshot(forPath: "messages").hasChild(SavedStatus.instance.userID) {
                    let title = channel.childSnapshot(forPath: "title").value as! String
                    let channelImage = channel.childSnapshot(forPath: "image").value as! String
                    let friends = channel.childSnapshot(forPath: "friends").value as! [String:String]
                    let _channel = Channel(channelTitle: title, channelImage: channelImage, channelID: channel.key, channelFriends: friends)
                    channelArray.append(_channel)
                }
            }
            if self.selectedChannel == nil {
                self.selectedChannel = channelArray.first
            }
            handler(channelArray)
        })
    }
    
    // MARK: Observe Users IDS
    func getAllFriendsIDs(handler: @escaping (_ ids: [String:String]) -> ()) {
        var idsDictionary = [String:String]()
        REF_USERS.observeSingleEvent(of: .value, with: { (snap) in
            guard let channelSnap = snap.children.allObjects as? [DataSnapshot] else { return }
            for _id in channelSnap {
                let id = _id.key
                guard let ign = _id.childSnapshot(forPath: "userIGNInfo").childSnapshot(forPath: "ign").value as? String else { return }
                idsDictionary[id] = ign
            }
            handler(idsDictionary)
        })
    }
    
    //Mark: Create Message
    func sendMessage(withContent content: String, userID id: String, channelID chID: String, handler: @escaping (_ messageSent: Bool) -> ()) {
        let data = ["content": content, "userId": id]
        REF_CHANNELS.child(chID).child("messages").childByAutoId().updateChildValues(data)
        handler(true)
    }
    
    //Mark: Get Message for the Channel
    func getMessages(forChannel channel: Channel, handler: @escaping (_ messages: [Message]) -> ()) {
        REF_CHANNELS.child(channel.channelID).child("messages").observeSingleEvent(of: .value, with: { (messageSnap) in
            var backMessage: [Message] = []
            guard let channelMessagesSnapshot = messageSnap.children.allObjects as? [DataSnapshot] else { return }
            for message in channelMessagesSnapshot {
                guard let content = message.childSnapshot(forPath: "content").value as? String else { return }
                guard let senderId = message.childSnapshot(forPath: "userId").value as? String else { return }
                let _message = Message(content: content, senderId: senderId)
                backMessage.append(_message)
            }
            handler(backMessage)
        })
    }
}
