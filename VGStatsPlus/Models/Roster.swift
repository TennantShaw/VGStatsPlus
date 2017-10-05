//
//  Roster.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 10/5/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation

class Roster {
    //MARK: - Properties
    let id: String
    let type: String
    
    let acesEarned: Int?
    let gold: Int?
    let heroKills: Int?
    let krakenCaptures: Int?
    let side: String?
    let turretKills: Int?
    let turretsRemaining: Int?
    
    let participants: [Participant]?
    
    
    //MARK: - Initializers
    init(id: String, type: String, acesEarned: Int?, gold: Int?, heroKills: Int?, krakenCaptures: Int?, side: String?, turretKills: Int?, turretsRemaining: Int?, participants: [Participant]?) {
        self.id = id
        self.type = type
        self.acesEarned = acesEarned
        self.gold = gold
        self.heroKills = heroKills
        self.krakenCaptures = krakenCaptures
        self.side = side
        self.turretKills = turretKills
        self.turretsRemaining = turretsRemaining
        self.participants = participants
    }

}
