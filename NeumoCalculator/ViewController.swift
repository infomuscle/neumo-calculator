//
//  ViewController.swift
//  NeumoCalculator
//
//  Created by 정보근 on 2020/03/08.
//  Copyright © 2020 Bokeun Jeong. All rights reserved.
//

import UIKit
import WebKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet var wkView: WKWebView!

    // UI Initializing
    override func viewDidLoad() {
        super.viewDidLoad()

        //contents 만듬.
        let contentController = WKUserContentController()
        let touchNumber = WKUserScript(source: "touchNumber()", injectionTime: .atDocumentEnd, forMainFrameOnly: true )
        let touchOperation = WKUserScript(source: "touchOperation()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let touchPlusMinus = WKUserScript(source: "touchPlusMinus()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let updateDisplay = WKUserScript(source: "updateDisplay()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let initCalculator  = WKUserScript(source: "initCalculator()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let log = WKUserScript(source: "log()", injectionTime: .atDocumentEnd, forMainFrameOnly: true)

        contentController.addUserScript(touchNumber)
        contentController.addUserScript(touchOperation)
        contentController.addUserScript(touchPlusMinus)
        contentController.addUserScript(updateDisplay)
        contentController.addUserScript(initCalculator)
        contentController.addUserScript(log)

        let config = WKWebViewConfiguration()
        config.userContentController = contentController

//        wkView = WKWebView(frame: CGRect.zero , configuration: config )
//        wkView = WKWebView(frame: self.wkView.bounds, configuration: config)
//        wkView = WKWebView(frame: CGRect(x: 0, y: 0, width: 375, height: 700), configuration: config)

        let localFilePath = Bundle.main.path(forResource: "calculator", ofType: "html")

        let url = URL(fileURLWithPath: localFilePath!)

        let request = URLRequest(url: url)
        wkView.load(request as URLRequest)
    }
}
