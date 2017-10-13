//
//  RoundedCellExtension.swift
//  VGStatsPlus
//
//  Created by Alisher Abdukarimov on 10/12/17.
//  Copyright © 2017 Tennant Shaw. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCell: UICollectionViewCell {
    
    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.tintColor = UIColor.white
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
        self.layer.cornerRadius = cornerRadius
    }
}
