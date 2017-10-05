//
//  Participant.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 10/5/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation

class Participant {
    //MARK: - Properties
    let id: String
    let type: String
    
    let actor: String?
    let assists: Int?
    let crystalMineCaptures: Int?
    let deaths: Int?
    let farm: Int?
    let firstAfkTime: Bool?
    let goldMineCaptures: Int?
    let itemGrants: [String: Any]?
    let itemSells: [String: Any]?
    let itemUses: [String: Any]?
    let items: [String]?
    let jungleKills: Int?
    let karmaLevel: Int?
    let kills: Int?
    let krakenCaptures: Int?
    let level: Int?
    let minionKills: Int?
    let nonJungleMinionKills: Int?
    let skillTier: Int?
    let skinKey: String?
    let turretCaptures: Int?
    let wentAfk: Bool?
    let winner: Bool?
    let player: Player?
    
    //MARK: - Initializers
    init(id: String, type: String, actor: String?, assists: Int?, crystalMineCaptures: Int?, deaths: Int?, farm: Int?, firstAfkTime: Bool?, goldMineCaptures: Int?, itemGrants: [String: Any]?, itemSells: [String: Any]?, itemUses: [String: Any]?, items: [String]?, jungleKills: Int?, karmaLevel: Int?, kills: Int?, krakenCaptures: Int?, level: Int?, minionKills: Int?, nonJungleMinionKills: Int?, skillTier: Int?, skinKey: String?, turretCaptures: Int?, wentAfk: Bool?, winner: Bool?, player: Player?) {
        self.id = id
        self.type = type
        self.actor = actor
        self.assists = assists
        self.crystalMineCaptures = crystalMineCaptures
        self.deaths = deaths
        self.farm = farm
        self.firstAfkTime = firstAfkTime
        self.goldMineCaptures = goldMineCaptures
        self.itemGrants = itemGrants
        self.itemSells = itemSells
        self.itemUses = itemUses
        self.items = items
        self.jungleKills = jungleKills
        self.karmaLevel = karmaLevel
        self.kills = kills
        self.krakenCaptures = krakenCaptures
        self.level = level
        self.minionKills = minionKills
        self.nonJungleMinionKills = nonJungleMinionKills
        self.skillTier = skillTier
        self.skinKey = skinKey
        self.turretCaptures = turretCaptures
        self.wentAfk = wentAfk
        self.winner = winner
        self.player = player
    }
}
