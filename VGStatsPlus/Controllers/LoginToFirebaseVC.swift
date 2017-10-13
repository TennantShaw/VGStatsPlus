//
//  LoginToFirebaseVC.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FacebookLogin

class LoginToFirebaseVC: UIViewController {
    
    var dict : [String : AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating button
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.frame = CGRect(x: 10 , y: view.frame.size.height - 150, width: view.frame.size.width - 20, height: 50)
        view.addSubview(loginButton)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let _ = FBSDKAccessToken.current(){
            getFBUserData()
        }
        
    }
    
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .email ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success:
                // Also this can be done success(let grantedPermissions, let declinedPermissions, let accessToken)
                self.getFBUserData()
            }
        }
    }
    
    //Mark: Fetch userData
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "email, id, name, picture.type(large)"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    guard let name = self.dict["name"] as? String else { return }
                    guard let id = self.dict["id"] as? String else { return }

                    FirebaseDatabase.instance.loginUserToFirebase(withEmail: "\(name.replacingOccurrences(of: " ", with: ""))@vgstatsplus.com", password: id, loginComplete: { (success, error) in
                        if success {
                            print("Successfully logged in")
                            SavedStatus.instance.isLoggedIn = true
                            self.showMainVC()
                        } else {
                            FirebaseDatabase.instance.registerUserToFirebase(withEmail: "\(name.replacingOccurrences(of: " ", with: ""))@vgstatsplus.com", password: id, name: name, accountType: "facebook", userCreationComplete: { (success, oError) in
                                if success {
                                    FirebaseDatabase.instance.createDBUser(name: name, userData: self.dict)
                                    SavedStatus.instance.isLoggedIn = true
                                    self.showMainVC()
                                }
                            })
                        }
                    })
                }
            })
        }
    }
    
    
    func showMainVC() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let swVC = storyBoard.instantiateViewController(withIdentifier: "chooseIGNVC") as! LoginViewController
        self.present(swVC, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
