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
    
    var content: String {
        return _content
    }
    
    var senderId: String {
        return _senderId
    }
    

    init(content: String, senderId: String) {
        self._senderId = senderId
        self._content = content
    }
}

