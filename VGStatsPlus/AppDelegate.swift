//
//  AppDelegate.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 9/25/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        if SavedStatus.instance.isLoggedIn {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let swVC = storyBoard.instantiateViewController(withIdentifier: "SWVC") as! UIViewController
            self.window?.rootViewController = swVC
        } else {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = storyBoard.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
            self.window?.rootViewController = loginVC
        }
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String, annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        return handled
    }

}

