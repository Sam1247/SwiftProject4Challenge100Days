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
                         "Google"  : "google.com",
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refresh))
        //
        let url = URL(string: "https://www." + nameToWebSite[webSite]!)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        navigationController?.isToolbarHidden = false
        // progress button
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
        let forwardbutton = UIBarButtonItem(title: "Forward", style: .plain, target: self, action: #selector(forward))
        let spacerLeft = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let spacerRight = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbarItems = [backButton, spacerLeft, progressButton, spacerRight, forwardbutton]
        //
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func refresh () {
        webView.reload()
    }
    
    @objc func back (action: UIAlertAction! = nil) {
        webView.goBack()
    }
    
    @objc func forward () {
        webView.goForward()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    // progress bar observering func
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        
        if let host  = url?.host {
            for webSite in nameToWebSite.values {
                if host.contains(webSite) {
                    decisionHandler(.allow)
                    return
                }
            }
        }
        let ACShowScore =  UIAlertController(title: "Waring", message: "this website is blocked", preferredStyle: .alert)
        ACShowScore.addAction(UIAlertAction(title: "cancel", style: .default, handler: back))
        present(ACShowScore, animated: true)
        decisionHandler(.cancel)
    }
    
}
