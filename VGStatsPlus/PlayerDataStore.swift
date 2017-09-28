//
//  PlayerDataStore.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 9/26/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation

class PlayerDataStore {
    //MARK: - Properties
    let baseURLString = "https://api.dc01.gamelockerapp.com/shards/na/players?filter[playerNames]=TennantTheVast"
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    var dataArray = [String]()
    
    
    //MARK: - Methods
    func fetchPlayerData() {
        let url = NSURL(string: baseURLString)
        var request = URLRequest(url: (url as URL?)!)
    request.addValue("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJiOTIwNTM2MC03NTUwLTAxMzUtMDc2NC0yNjU5ZGNhZmNkOWEiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTA0NzE2MzMyLCJwdWIiOiJzZW1jIiwidGl0bGUiOiJ2YWluZ2xvcnkiLCJhcHAiOiJiOTEyNTJiMC03NTUwLTAxMzUtMDc2Mi0yNjU5ZGNhZmNkOWEiLCJzY29wZSI6ImNvbW11bml0eSIsImxpbWl0IjoxMH0.sEQeY5CxgrQpPtiSn8R9TlmhIEDmHYumN_1AssKAcB4", forHTTPHeaderField: "Authorization")
        request.addValue("application/vnd.api+json", forHTTPHeaderField: "Accept")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
                    print(jsonData!.value(forKey: "data") as Any)
                            if let sampleArray = jsonData!.value(forKey: "attributes") as? NSArray {
                                for sample in sampleArray {
                                    if let dataDict = sample as? NSDictionary {
                                        if let name = dataDict.value(forKey: "stats") {
                                            self.dataArray.append(name as! String)
                                        }
                                    }
                                }
                            }
                } catch {
                    print(error)
                }
            }
    }.resume()
    }
    
}
