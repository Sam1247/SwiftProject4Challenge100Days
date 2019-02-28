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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
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
