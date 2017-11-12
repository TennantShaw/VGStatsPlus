//
//  TwitchDataService.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 11/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import Alamofire

class TwitchDataService {
    
    static let instance = TwitchDataService()
    
    var games = [Game]()
    
    func downloadTopGames(completed: @escaping DownloadCompleted) {
        
        let url = TWITCH_URL_TOP_GAMES
        var nameString, imageUrlString: String!
        
        request(url).responseJSON { (responce) in
            if let JSON = responce.result.value as? [String:Any] {
                if let topGamesArray = JSON["top"] as? [[String:Any]], topGamesArray.count > 0 {
                    for i in topGamesArray {
                        if let gameDict = i["game"] as? [String:Any] {
                            if let gameName = gameDict["name"] as? String {
                                nameString = gameName
                            }
                            
                            if let boxArt = gameDict["box"] as? [String:Any] {
                                if let imageUrl = boxArt["large"] as? String {
                                    imageUrlString = imageUrl
                                }
                            }
                        }
                        
                        let game = Game(name: nameString, imageURL: imageUrlString)
                        self.games.append(game)
                    }
                }
            }
            completed()
        }
    }

}
