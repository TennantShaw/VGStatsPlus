//
//  AppDelegate.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 9/25/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        SavedStatus.instance.isLoggedIn = false 
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        if SavedStatus.instance.isLoggedIn {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let swVC = storyBoard.instantiateViewController(withIdentifier: "SWVC")
            self.window?.rootViewController = swVC
        } else {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = storyBoard.instantiateViewController(withIdentifier: "loginToFirebase")
            self.window?.rootViewController = loginVC
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }

}

