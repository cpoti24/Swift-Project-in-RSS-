//
//  FeedTableViewController.swift
//  RSSwift
//
//  Created by Westchester gov on 7/16/2015.
//  Copyright (c) 2015 Westchester County. All rights reserved.
//


import UIKit

class FeedTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate, NSXMLParserDelegate {

    var myFeed : NSArray = []
    var url: NSURL = NSURL()
    
    
    // added for pull to refresh
    func refresh(sender:AnyObject)
    {
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
   
    // up to here for pull to refresh
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // added for pull to refresh
        self.refreshControl?.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        
        // up to here for pull to refresh
    

        // Cell height.
        self.tableView.rowHeight = 70
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Set feed url. http://www.formula1.com/rss/news/latest.rss
        url = NSURL(string: "http://www3.westchestergov.com/home/all-press-releases?format=feed&type=rss")!
        // Call custom function.
        loadRss(url);

    }
    
    
    // added for pull to refresh

    
    // up to here for pull to refresh

    func loadRss(data: NSURL) {
        // XmlParserManager instance/object/variable
        var myParser : XmlParserManager = XmlParserManager.alloc().initWithURL(data) as! XmlParserManager
        // Put feed in array
        myFeed = myParser.feeds
        
        tableView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let newUrl = segue.destinationViewController as? NewFeedViewController {
            newUrl.onDataAvailable = {[weak self]
                (data) in
                if let weakSelf = self {
                    weakSelf.loadRss(data)
                }
            }
        }
        
        else if segue.identifier == "openPage" {
            
            var indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow()!
            //let selectedFeedURL: String = feeds[indexPath.row].objectForKey("link") as String
            let selectedFTitle: String = myFeed[indexPath.row].objectForKey("title") as! String
            let selectedFContent: String = myFeed[indexPath.row].objectForKey("description") as! String
            let selectedFURL: String = myFeed[indexPath.row].objectForKey("link") as! String
            
            // Instance of our feedpageviewcontrolelr
            let fpvc: FeedPageViewController = segue.destinationViewController as! FeedPageViewController

            fpvc.selectedFeedTitle = selectedFTitle
            fpvc.selectedFeedFeedContent = selectedFContent
            fpvc.selectedFeedURL = selectedFURL
        }
    }
    

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFeed.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        // Feeds dictionary.
        var dict : NSDictionary! = myFeed.objectAtIndex(indexPath.row) as! NSDictionary
        
        // Set cell properties.
        cell.textLabel?.text = myFeed.objectAtIndex(indexPath.row).objectForKey("title") as? String

        cell.detailTextLabel?.text = myFeed.objectAtIndex(indexPath.row).objectForKey("pubDate") as? String

        return cell
    }
    

    
}
