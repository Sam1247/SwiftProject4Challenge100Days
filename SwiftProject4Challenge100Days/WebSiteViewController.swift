//
//  WebSiteViewController.swift
//  SwiftProject4Challenge100Days
//
//  Created by Abdalla Elsaman on 2/28/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit
import WebKit

class WebSiteViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var progressView: UIProgressView!
    var nameToWebSite = ["Apple"   : "apple.com",
                         "Medium"  : "Medium.com",
                         "Facebook": "facebook.com",
                         "Youtube" : "youtube.com",
                         "Twitter" : "twitter.com",
                         "Linkedin": "linkedin.com"
                        ]
    var webSite: String!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        //
        let url = URL(string: "https://www." + nameToWebSite[webSite]!)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        navigationController?.isToolbarHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
}
