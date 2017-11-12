//
//  Game.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 11/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation
import Alamofire

class Game {
    var gameName: String
    var gameImageURL: String
    var gameImage: UIImage?
    
    init(name: String, imageURL: String) {
        self.gameName = name
        self.gameImageURL = imageURL
    }
    
    func downloadGameImage(completed: @escaping DownloadCompleted) {
        request(self.gameImageURL).responseData { (responce) in
            if let data = responce.result.value {
                if let image = UIImage(data: data) {
                    self.gameImage = image
                }
            }
            completed()
        }
    }
}
