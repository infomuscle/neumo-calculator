//
//  ViewController.swift
//  NeumoCalculator
//
//  Created by 정보근 on 2020/03/08.
//  Copyright © 2020 Bokeun Jeong. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    // Logic Variables
    var result: Int = 0
    var input1: String = ""
    var input2: String = ""
    var calType: String = ""
    
    @IBOutlet var vvBtn1: UIButton!
    
    // UI Variables
    @IBOutlet var lblResult: UILabel!
    
    @IBOutlet var vBtn1: UIButton!
    @IBOutlet var vBtn2: UIButton!
    @IBOutlet var vBtn3: UIButton!
    @IBOutlet var vBtn4: UIButton!
    @IBOutlet var vBtn5: UIButton!
    @IBOutlet var vBtn6: UIButton!
    @IBOutlet var vBtn7: UIButton!
    @IBOutlet var vBtn8: UIButton!
    @IBOutlet var vBtn9: UIButton!
    @IBOutlet var vBtn0: UIButton!
    @IBOutlet var vBtn00: UIButton!

    @IBOutlet var vBtnPnt: UIButton!
    @IBOutlet var vBtnEql: UIButton!
    @IBOutlet var vBtnAdd: UIButton!
    @IBOutlet var vBtnSub: UIButton!
    @IBOutlet var vBtnMul: UIButton!
    @IBOutlet var vBtnDiv: UIButton!
    @IBOutlet var vBtnMod: UIButton!
    @IBOutlet var vBtnPm: UIButton!
    @IBOutlet var vBtnAc: UIButton!
    
    
    // UI Initializing
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttons = [vBtn1, vBtn2, vBtn3, vBtn4, vBtn5, vBtn6, vBtn7, vBtn8, vBtn9, vBtn0, vBtn00, vBtnPnt, vBtnEql, vBtnAdd, vBtnSub, vBtnMul, vBtnDiv, vBtnMod, vBtnPm, vBtnAc]
        
        
//        for b in buttons {
//            let layer1 = CALayer()
//            let layer2 = CALayer()
//
//            layer1.backgroundColor = self.view.backgroundColor?.cgColor
//            layer1.frame = vBtn1.bounds
//            layer1.cornerRadius = 16
//            layer1.shadowRadius = 3
//            layer1.shadowOpacity = 1
//            layer1.shadowOffset = CGSize(width: 3, height: 3)
//            layer1.shadowColor = UIColor.gray.cgColor
//    //        layer1.needsDisplayOnBoundsChange = true
//            b?.layer.insertSublayer(layer1, at: 0)
//
//            layer2.backgroundColor = self.view.backgroundColor?.cgColor
//            layer2.frame = vBtn1.bounds
//            layer2.cornerRadius = 16
//            layer2.shadowRadius = 3
//            layer2.shadowOpacity = 1
//            layer2.shadowOffset = CGSize(width: -3, height: -3)
//            layer2.shadowColor = UIColor.white.cgColor
//    //        layer2.needsDisplayOnBoundsChange = true
//            b?.layer.insertSublayer(layer2, at: 1)
//        }
    }

    // UI Button Actions
    @IBAction func btn0(_ sender: UIButton) {
        touchBtnNum(val: "0")
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        touchBtnNum(val: "1")
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        touchBtnNum(val: "2")
    }
    
    @IBAction func btn3(_ sender: UIButton) {
        touchBtnNum(val: "3")
    }
    
    @IBAction func btn4(_ sender: UIButton) {
        touchBtnNum(val: "4")
    }
    
    @IBAction func btn5(_ sender: UIButton) {
        touchBtnNum(val: "5")
    }
    
    @IBAction func btn6(_ sender: UIButton) {
        touchBtnNum(val: "6")
    }
    
    @IBAction func btn7(_ sender: UIButton) {
        touchBtnNum(val: "7")
    }
    
    @IBAction func btn8(_ sender: UIButton) {
        touchBtnNum(val: "8")
    }
    
    @IBAction func btn9(_ sender: UIButton) {
        touchBtnNum(val: "9")
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        touchBtnCal(val: "add")
    }
    
    @IBAction func btnSub(_ sender: UIButton) {
        touchBtnCal(val: "sub")
    }
    
    @IBAction func btnMul(_ sender: UIButton) {
        touchBtnCal(val: "mul")
    }
    
    @IBAction func btnDiv(_ sender: UIButton) {
        touchBtnCal(val: "div")
    }
    
    @IBAction func btnEql(_ sender: UIButton) {
        touchBtnEql()
    }

    @IBAction func btnAc(_ sender: UIButton) {
        initCalculator(initLabel: true)
    }
    
    
    func labeling(val: String) {
        lblResult.text = val
    }
    
    func initCalculator(initLabel: Bool) {
        result = 0
        input1 = ""
        input2 = ""
        calType = ""
        
        if initLabel == true {
            labeling(val: String(result))
        }
    }

    func touchBtnNum(val: String) {
        if calType == "" {
            input1 += val
            labeling(val: input1)
        } else {
            input2 += val
            labeling(val: input2)
        }
    }
    
    func calculator(calType: String) {
        switch calType {
        case "add":
            result = Int(input1)! + Int(input2)!
            labeling(val: String(result))
        case "sub":
            result = Int(input1)! - Int(input2)!
            labeling(val: String(result))
        case "mul":
            result = Int(input1)! * Int(input2)!
            labeling(val: String(result))
        case "div":
            result = Int(input1)! / Int(input2)!
            labeling(val: String(result))
        default:
            break
        }
    }
    
    func touchBtnCal(val: String) {
        if calType != "" {
            calculator(calType: calType)
            
            input1 = String(result)
            input2 = ""
        }
        
        calType = val
        
        if input2 == "" {
            
            
        } else {
            calculator(calType: calType)
            
            input1 = String(result)
            input2 = ""
        }
    
    }
    
    func touchBtnEql(){
        
        if input2 == "" {
            
        } else {
            calculator(calType: calType)
        }
        calType = ""
        input1 = String(result)
        input2 = ""
    }


}
