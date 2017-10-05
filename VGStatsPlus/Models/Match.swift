//
//  Match.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 10/5/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation

class Match {
    //MARK: - Properties
    let id: String
    let type: String
    
    let patchVersion: String?
    let shardID: String?
    let titleID: String?
    let gameMode: String?
    let duration: Int?
    let createdAt: String?
    let queue: String?
    let endGameReason: String?
    
    let assets: [Assets]?
    let roster: [Roster]?
    
    
    //MARK: - Initializers
    init(id: String, type: String, patchVersion: String?, shardID: String?, titleID: String?, gameMode: String?, duration: Int?, createdAt: String?, queue: String?, endGameReason: String?, assets: [Assets]?, roster: [Roster]?) {
        self.id = id
        self.type = type
        self.patchVersion = patchVersion
        self.shardID = shardID
        self.titleID = titleID
        self.gameMode = gameMode
        self.duration = duration
        self.createdAt = createdAt
        self.queue = queue
        self.endGameReason = endGameReason
        self.assets = assets
        self.roster = roster
    }

}
