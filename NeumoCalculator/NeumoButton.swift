//
//  NeumoButton.swift
//  NeumoCalculator
//
//  Created by 정보근 on 2020/03/09.
//  Copyright © 2020 Bokeun Jeong. All rights reserved.
//

import UIKit

@IBDesignable
class NeumoButton: UIButton {
    
    let layer1 = CALayer()
    let layer2 = CALayer()

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
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear{
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize() {
        didSet{
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet{
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet{
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var bgColor: UIColor? = UIColor.clear{
        didSet{
            self.backgroundColor = bgColor
        }
    }
    
}
