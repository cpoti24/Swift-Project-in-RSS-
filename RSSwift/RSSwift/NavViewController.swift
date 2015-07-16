//
//  NavViewController.swift
//  RSSwift
//
//  Created by Westchester gov on 7/16/2015.
//  Copyright (c) 2015 Westchester County. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController {
    
    var color = UIColor.blueColor() 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().barTintColor = UIColor.blueColor() 

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
