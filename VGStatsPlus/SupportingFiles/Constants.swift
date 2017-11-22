//
//  Constants.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 11/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation


// base : https://api.twitch.tv/kraken
// clientID: mxdcbd0bp151snfpkswmwhg6op4wow

let TWITCH_URL_VG = "https://api.twitch.tv/kraken/streams?game="
let TWITCH_CLIENT_ID = "&client_id=mxdcbd0bp151snfpkswmwhg6op4wow"
let TWITCH_URL_STREAM_DEEP_LINK = "twitch://open?stream="
let TWITCH_URL_EMBED_BASE = "https://player.twitch.tv/?channel="

typealias DownloadCompleted = () -> ()
