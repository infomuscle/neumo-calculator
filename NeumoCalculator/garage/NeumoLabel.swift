//
//  NeumoLabel.swift
//  NeumoCalculator
//
//  Created by 정보근 on 2020/03/09.
//  Copyright © 2020 Bokeun Jeong. All rights reserved.
//

import UIKit
import SwiftUI

@IBDesignable
class NeumoLabel: UILabel {
    
    let layer1 = CALayer()
    let layer2 = CALayer()
    let layerText = CATextLayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = self.frame.size
//        self.clipsToBounds = true
        
        layer1.backgroundColor = self.backgroundColor?.cgColor
        layer1.frame = self.bounds
//        layer1.frame = CGRect(x: -3, y: -3, width: 366, height: 90)
        layer1.cornerRadius = cornerRadius
//        layer1.shadowRadius = 3
//        layer1.shadowOpacity = 1
//        layer1.shadowOffset = CGSize(width: 3, height: 3)
//        layer1.shadowColor = UIColor.gray.cgColor
        layer1.shadowRadius = shadowRadius1
        layer1.shadowOpacity = shadowOpacity1
        layer1.shadowOffset = shadowOffset1
        layer1.shadowColor = shadowColor1.cgColor
        self.layer.insertSublayer(layer1, at: 0)
        
        layer2.backgroundColor = self.backgroundColor?.cgColor
        layer2.frame = self.bounds
//        layer2.frame = CGRect(x: 3, y: 3, width: 366, height: 90)
        layer2.cornerRadius = cornerRadius
//        layer2.shadowRadius = 3
//        layer2.shadowOpacity = 1
//        layer2.shadowOffset = CGSize(width: -3, height: -3)
//        layer2.shadowColor = UIColor.white.cgColor
        layer2.shadowRadius = shadowRadius2
        layer2.shadowOpacity = shadowOpacity2
        layer2.shadowOffset = shadowOffset2
        layer2.shadowColor = shadowColor2.cgColor
        self.layer.insertSublayer(layer2, at: 1)
        
        layerText.frame = self.bounds
        layerText.string = "0"
        layerText.font = UIFont.systemFont(ofSize: 72.0)
        layerText.fontSize = 72
        layerText.foregroundColor = textColor.cgColor
        layerText.alignmentMode = CATextLayerAlignmentMode.right
        layerText.isWrapped = true
//        layerText.setNeedsDisplay()
//        layerText.setNeedsLayout()

        self.layer.insertSublayer(layerText, at: 2)
        
        
        
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
        self.layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var shadowColor1: UIColor = UIColor.clear{
        didSet{
//            self.layer.shadowColor = shadowColor1.cgColor
        }
    }

    @IBInspectable var shadowOffset1: CGSize = CGSize() {
        didSet{
//            self.layer.shadowOffset = shadowOffset1
        }
    }
    
    @IBInspectable var shadowOpacity1: Float = 0 {
        didSet{
//            self.layer.shadowOpacity = shadowOpacity1
        }
    }
    
    @IBInspectable var shadowRadius1: CGFloat = 0 {
        didSet{
//            self.layer.shadowRadius = shadowRadius1
        }
    }
    
    @IBInspectable var shadowColor2: UIColor = UIColor.clear{
        didSet{
//            self.layer.shadowColor = shadowColor2.cgColor
        }
    }

    @IBInspectable var shadowOffset2: CGSize = CGSize() {
        didSet{
//            self.layer.shadowOffset = shadowOffset2
        }
    }
    
    @IBInspectable var shadowOpacity2: Float = 0 {
        didSet{
//            self.layer.shadowOpacity = shadowOpacity2
        }
    }
    
    @IBInspectable var shadowRadius2: CGFloat = 0 {
        didSet{
//            self.layer.shadowRadius = shadowRadius2
        }
    }
    
    @IBInspectable var bgColor: UIColor? = UIColor.clear{
        didSet{
            self.backgroundColor = bgColor
        }
    }
    
//    @IBInspectable override var textColor: UICol
}
