//
//  Player.swift
//  VGStatsPlus
//
//  Created by Alisher A. on 10/3/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation

class Player {
    let name: String
    let id: String
    let titleId: String
    let shardId: String?
    let createdAt: Date
    let played: Int
    let playedRank: Int
    let level: Int
    let xp: Double
    let lossStreak: Int
    let wins: Int
    let winStreak: Int
    let lifeTimeGold: Double
    
    init(name: String, id: String, titleId: String, shardId: String?, createdAt: Date, played: Int, playedRank: Int, level: Int, xp: Double, lossStreak: Int, wins: Int, winStreak: Int, lifetimeGold: Double) {
        self.name = name
        self.id = id
        self.titleId = titleId
        self.shardId = shardId
        self.createdAt = createdAt
        self.played = played
        self.playedRank = playedRank
        self.level = level
        self.xp = xp
        self.lossStreak = lossStreak
        self.wins = wins
        self.winStreak = winStreak
        self.lifeTimeGold = lifetimeGold
    }
}
