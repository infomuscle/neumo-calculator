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
    
    var result: Int = 0
    var tempStr: String = ""
    var tempStr2: String = ""
    var tempInt: Int = 0
    
    
    @IBOutlet var lblResult: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


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
        touchBtnCal(val: "eql")
    }
    
    func touchBtnNum(val: String) {
        tempStr += val
        labeling(val: Int(tempStr)!)
    }
    
    func touchBtnCal(val: String) {
        result += Int(tempStr)!
        labeling(val: result)
        tempStr = ""
    }
    
    func labeling(val: Int) {
        lblResult.text = String(val)
    }
}

