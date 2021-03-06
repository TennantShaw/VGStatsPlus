//
//  UIViewShadow.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/9/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

@IBDesignable
class Shadow: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 20.0 {
        didSet {
            self.layer.masksToBounds = false
            self.layer.shadowOffset = CGSize(width: 0, height: 1)
            self.layer.shadowRadius = 1
            self.layer.shadowColor = UIColor.white.cgColor
            self.layer.shadowOpacity = 0.5
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 1
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.5
    }
}
