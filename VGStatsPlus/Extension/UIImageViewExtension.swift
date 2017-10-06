//
//  UIImageViewExtension.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/5/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {
    
    
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
