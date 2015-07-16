//
//  NewFeedViewController.swift
//  RSSwift
//
//  Created by Westchester gov on 7/16/2015.
//  Copyright (c) 2015 Westchester County. All rights reserved.
//

import UIKit

class NewFeedViewController: UIViewController {

    @IBOutlet var textFieldNewFeedUrl: UITextField!
    
    // Reusbale member
    var onDataAvailable : ((data: NSURL) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneTapped(sender: AnyObject) {
        
        // Send new Url
        if (textFieldNewFeedUrl.text != "") {
            self.onDataAvailable?(data: NSURL(string: textFieldNewFeedUrl.text)!)
            self.navigationController?.popToRootViewControllerAnimated(true)
        } else {
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
