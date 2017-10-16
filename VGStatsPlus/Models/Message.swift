//
//  Message.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/15/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation

class Message {
    
    private var _content: String
    private var _senderId: String
    private var _senderIGN: String
    private var _senderAvatar: String
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    
    var senderIGN: String {
        return _senderIGN
    }
    
    var senderAvatar: String {
        return _senderAvatar
    }
    
    init(content: String, senderId: String, senderIGN: String, senderAvatar: String) {
        self._senderId = senderId
        self._content = content
        self._senderIGN = senderIGN
        self._senderAvatar = senderAvatar
    }
}

