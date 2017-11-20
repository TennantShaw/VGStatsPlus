//
//  TwitchChannelVC.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 11/20/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//


import UIKit
import WebKit

class TwitchChannelVC: UIViewController {

    @IBOutlet var webView: UIWebView!
    var stream: Stream!
    @IBOutlet var webViewContainerView: UIView!
    @IBOutlet var broadcasterName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        broadcasterName.text = stream.broadcasterName
        let urlString = TWITCH_URL_EMBED_BASE + stream.broadcasterName
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func dismissBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
