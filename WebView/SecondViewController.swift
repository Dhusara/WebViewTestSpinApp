//
//  SecondViewController.swift
//  WebView
//
//  Created by Serhii Demianenko on 10.09.2020.
//  Copyright © 2020 Serhii Demianenko. All rights reserved.
//

import Foundation
import WebKit

class SecondViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.load(URLRequest(url: URL(string: "https://mostbet.com")!))
    }
}
