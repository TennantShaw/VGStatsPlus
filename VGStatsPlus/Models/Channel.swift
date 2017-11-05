//
//  Channel.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/13/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation

class Channel {
    
    private var _channelTitle: String
    private var _channelImage: String
    private var _channelID: String
    private var _channelFriends: [String:String]
    
    var channelTitle: String {
        return _channelTitle
    }
    
    var channelImage: String {
        return _channelImage
    }
    
    var channelID: String {
        return _channelID
    }
    var channelFriends: [String:String] {
        return _channelFriends
    }
    
    init(channelTitle: String, channelImage: String, channelID: String, channelFriends: [String:String]) {
        self._channelTitle = channelTitle
        self._channelImage = channelImage
        self._channelID = channelID
        self._channelFriends = channelFriends
    }
    
    func setAvatar(avatar: String) {
        self._channelImage = avatar
    }
}
