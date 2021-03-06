//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Josh Gebbeken on 2/14/16.
//  Copyright © 2016 Josh Gebbeken. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var tweets: [Tweet]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        

        // Do any additional setup after loading the view.
        
        TwitterClient.sharedInstance.homeTimelineWithParams(nil, completion: { (tweets, error) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return (tweets?.count)!
        }
        else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HometimelineCell", forIndexPath: indexPath) as? HomeTimelineCellTableViewCell
        
        cell?.tweet = tweets![indexPath.row]
        
        return cell!
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detailview")
        {
            let cell = sender as! HomeTimelineCellTableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let tweet = tweets![indexPath!.row]
            
            let detailViewController = segue.destinationViewController as! UserProfileController
            detailViewController.tweets = tweet
        }
    }


}
