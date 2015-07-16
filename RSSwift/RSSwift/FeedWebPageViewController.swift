//
//  FeedWebPageViewController.swift
//  RSSwift
//
//  Created by Westchester gov on 7/16/2015.
//  Copyright (c) 2015 Westchester County. All rights reserved.
//

import UIKit

class FeedWebPageViewController: UIViewController {
    
    var feedURL = ""

    @IBOutlet var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.loadRequest(NSURLRequest(URL: NSURL(string: feedURL)!))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
