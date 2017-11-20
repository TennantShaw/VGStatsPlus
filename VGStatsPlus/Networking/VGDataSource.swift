//
//  VGDataSource.swift
//  VGStatsPlus
//
//  Created by Alisher A. on 10/3/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import VaingloryAPI

class VGDataSource {
    
    static let instance = VGDataSource()
    
    var delegate: PlayerProfileViewController?
    var matchDelegate: MatchHistoryViewController?
    let filters = RouterFilters()
    var player: PlayerResource? {
        didSet {
            delegate?.tableView.reloadData()
        }
    }
    var matchDetails: MatchResource? {
        didSet {
            delegate?.tableView.reloadData()
        }
    }
    
    var matches = [MatchResource]()
    var assets = [AssetResource]()
    
    var selectedAsset: AssetResource? {
        didSet {
            getAssetForTheMatch(match: selectedMatch!) { (assetArray) in
                self.assets = assetArray
            }
        }
    }
    
    var selectedMatch: MatchResource? {
        didSet {
            getRosterForTheMatch(match: selectedMatch!) { (rosterArray) in
                    self.currentRosterResource = rosterArray
            }
        }
    }
    var currentRosterResource = [RosterResource]() {
        didSet {
            getParticipantsForTheMatch(rosterResource: currentRosterResource) { (participantArray) in
                self.participantResources = participantArray
            }
            print(currentRosterResource)
            print("\n")
        }
    }
    var participantResources = [String:[ParticipantResource]]() {
        didSet {
            print(participantResources)
            print("\n")
        }
    }
    
    private let vainGloryAPI = VaingloryAPIClient(apiKey: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJiOTIwNTM2MC03NTUwLTAxMzUtMDc2NC0yNjU5ZGNhZmNkOWEiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTA0NzE2MzMyLCJwdWIiOiJzZW1jIiwidGl0bGUiOiJ2YWluZ2xvcnkiLCJhcHAiOiJiOTEyNTJiMC03NTUwLTAxMzUtMDc2Mi0yNjU5ZGNhZmNkOWEiLCJzY29wZSI6ImNvbW11bml0eSIsImxpbWl0IjoxMH0.sEQeY5CxgrQpPtiSn8R9TlmhIEDmHYumN_1AssKAcB4")
    
    // Get User Info
    func getUserData(name: String, regional shard: String, success: @escaping (Bool) -> ()) {
        vainGloryAPI.getPlayer(withName: name, shard: Shard(rawValue: shard)!) { (player, error) in
            if error != nil {
                print(error.debugDescription)
                success(false)
            } else {
                self.player = player!
                success(true)
            }
        }
    }
    
    func getMatches(regional shard: String, success: @escaping (Bool) -> ()) {
        guard let player = self.player else {
            return
        }
        let filter = filters.playerName(player.name!)
        
        vainGloryAPI.getMatches(shard: Shard(rawValue: (player.shardId)!)!, filters: filter) { (resourse, error) in
            if error != nil {
                success(false)
            } else {
                for i in resourse! {
                    self.matches.append(i)
                }
                success(true)
            }
        }
    }
    
    
    func getMatch(withId id: String, regional shard: String, success: @escaping (Bool) -> ()) {
        
        vainGloryAPI.getMatch(withId: id, shard: Shard(rawValue: shard)!) { (oMatchResource, oError) in
            if oError != nil {
                success(false)
            } else {
                self.selectedMatch = oMatchResource
                success(true)
            }
        }
    }
    
    // MARK: Get Roster Match
    func getRosterForTheMatch(match: MatchResource, success: @escaping ([RosterResource]) -> ()) {
        guard let roster = match.rosters else {
            return
        }
        success(roster)
    }
    
    //MARK: Get Asset for the match
    func getAssetForTheMatch(match: MatchResource, success: @escaping ([AssetResource]) -> ()) {
        guard let asset = match.asset else {
            return
        }
        success(asset)
    }
    
    // MARK: Get Participants array
    func getParticipantsForTheMatch(rosterResource: [RosterResource], success: @escaping ([String : [ParticipantResource]]) -> ()) {
        guard let leftTeam = rosterResource[0].participants,
            let rightTeam = rosterResource[1].participants else {
                return
        }
        let back = ["teamL": leftTeam, "teamR": rightTeam]
        success(back)
    }
}
