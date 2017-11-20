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

    var stream: Stream!
    var webView: WKWebView!
    @IBOutlet var webViewContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: view.frame)
        webViewContainerView.addSubview(webView)
        
        let urlString = TWITCH_URL_EMBED_BASE + stream.broadcasterName
        print(urlString)
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
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
