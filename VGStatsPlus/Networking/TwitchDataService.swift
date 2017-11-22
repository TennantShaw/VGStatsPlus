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
    var streams = [Stream]()
    var games = [Game]()
    
    func downloadTopGames(completed: @escaping DownloadCompleted) {
        
        let url = TWITCH_URL_VG
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
    
    func downloadStreams(completed: @escaping DownloadCompleted) {
        
        // Get //streams
        var viewerCountDouble: Double!
        var imageUrlString, nameString, titleString: String!
        let gameString = "Vainglory"
        let url = TWITCH_URL_VG + gameString + TWITCH_CLIENT_ID
        
        request(url).responseJSON { (responce) in
            if let JSON = responce.result.value as? [String:Any] {
                if let streamsArray = JSON["streams"] as? [Dictionary<String, Any>], streamsArray.count > 0 {
                    print(streamsArray)
                    for i in 0..<streamsArray.count {
                        if let viewerCount = streamsArray[i]["viewers"] as? Double {
                            viewerCountDouble = viewerCount
                        }
                        
                        if let imageDict = streamsArray[i]["preview"] as? [String : Any] {
                            if let imageUrl = imageDict["large"] as? String {
                                imageUrlString = imageUrl
                            }
                        }
                        
                        if let channelDict = streamsArray[i]["channel"] as? [String : Any] {
                            if let name = channelDict["display_name"] as? String {
                                nameString = name
                            }
                            
                            if let title = channelDict["status"] as? String {
                                titleString = title
                            }
                        }
                        let stream = Stream(name: nameString, title: titleString, viewerCount: viewerCountDouble, imageUrl: imageUrlString)
                        self.streams.append(stream)
                    }
                }
            }
            completed()
        }
    }

}
