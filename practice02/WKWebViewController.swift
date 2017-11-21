//
//  ViewController.swift
//  practice02
//
//  Created by 中村太一 on 2017/11/20.
//  Copyright © 2017年 Asaichi LLC. All rights reserved.
//

import UIKit
import WebKit
class WKWebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
}

