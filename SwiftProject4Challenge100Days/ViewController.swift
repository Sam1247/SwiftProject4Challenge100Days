//
//  ViewController.swift
//  SwiftProject4Challenge100Days
//
//  Created by Abdalla Elsaman on 2/28/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

import UIKit

class WebSitesList: UITableViewController {

    var webSites = ["Google", "Apple", "Medium", "Facebook", "Youtube", "Twitter", "LinkedIn"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fast Browser"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webSites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WebSite", for: indexPath)
        cell.textLabel?.text = webSites[indexPath.row]
        cell.imageView?.image = UIImage(named: webSites[indexPath.row])!
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "WebLoader") as? WebSiteViewController {
            vc.webSite = webSites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
}

