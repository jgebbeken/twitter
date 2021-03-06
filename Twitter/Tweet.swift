//
//  Tweet.swift
//  Twitter
//
//  Created by Josh Gebbeken on 2/14/16.
//  Copyright © 2016 Josh Gebbeken. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    var favoriteCount: Int?
    var retweetCount: Int?
    var tweetId: String?
    var httpsProfileUrl: String?
    var retweeted: Bool?

    
    init(dictionary: NSDictionary) {
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        favoriteCount = dictionary["favorite_count"] as? Int
        retweetCount = dictionary["retweet_count"] as? Int
        tweetId = dictionary["id_str"] as? String
        httpsProfileUrl = dictionary["profile_image_url_https"] as? String
        retweeted = dictionary["retweeted"] as? Bool
        tweetId = dictionary["id_str"] as? String
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
        
        
        
    }
    
    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in array {
            tweets.append(Tweet(dictionary: dictionary))
        }
        
        return tweets
    }
}
