//
//  Message.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/15/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import Firebase

class Message {
    
    private var _content: String
    private var _senderId: String
    private var _messageType: String
    private var _userShard: String
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    var messageType: String {
        return _messageType
    }
    
    var userShard: String {
        return _userShard
    }

    init(content: String, senderId: String, messageType: String, userShard: String) {
        self._senderId = senderId
        self._content = content
        self._messageType = messageType
        self._userShard = userShard
    }
}

