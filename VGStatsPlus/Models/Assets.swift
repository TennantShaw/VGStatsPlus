//
//  Assets.swift
//  VGStatsPlus
//
//  Created by Tennant Shaw on 10/5/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import Foundation

class Assets {
    //MARK: - Properties
    let id: String
    let type: String
    
    let url: String?
    let contentType: String?
    let createdAt: String?
    let description: String?
    let filename: String?
    let name: String?
    
    
    //MARK: - Initializers
    init(id: String, type: String, url: String?, contentType: String?, createdAt: String?, description: String?, filename: String?, name: String?) {
        self.id = id
        self.type = type
        self.url = url
        self.contentType = contentType
        self.createdAt = createdAt
        self.description = description
        self.filename = filename
        self.name = name
    }
    
}
