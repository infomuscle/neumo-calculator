//
//  NeumoLabel.swift
//  NeumoCalculator
//
//  Created by 정보근 on 2020/03/09.
//  Copyright © 2020 Bokeun Jeong. All rights reserved.
//

import UIKit

@IBDesignable
class NeumoLabel: UILabel {

    @IBInspectable var shdwColor: UIColor = UIColor.clear{
        didSet{
            self.layer.shadowColor = shdwColor.cgColor
        }
    }

    @IBInspectable var shdwOffset: CGSize = CGSize() {
        didSet{
            self.layer.shadowOffset = shdwOffset
        }
    }
    
    @IBInspectable var shdwOpacity: Float = 0 {
        didSet{
            self.layer.shadowOpacity = shdwOpacity
        }
    }
    
    @IBInspectable var sgdwRadius: CGFloat = 0 {
        didSet{
            self.layer.shadowRadius = sgdwRadius
        }
    }
    
    @IBInspectable var bgColor: UIColor? = UIColor.clear{
        didSet{
            self.backgroundColor = bgColor
        }
    }
}
