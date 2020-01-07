//
//  PostData.swift
//  Instagram
//
//  Created by hirotaka.iwasaki on 2020/01/04.
//  Copyright © 2020 hirotaka.iwasaki. All rights reserved.
//

import UIKit
import Firebase

class PostData: NSObject {
    var id: String?
    var image: UIImage?
    var imageString: String?
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    var commentArray:[Comment] = []
    
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: Any]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: Data(base64Encoded: imageString!, options: .ignoreUnknownCharacters)!)
        
        self.name = valueDictionary["name"] as? String
        
        self.caption = valueDictionary["caption"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = Date(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        
        if let likes = valueDictionary["likes"] as? [String] {
            self.likes = likes
        }
        
        for likeId in self.likes {
            if likeId == myId {
                self.isLiked = true
                break
            }
        }
        
        
        //print("test0105n05")
        //if let commentData = valueDictionary["comments"] as? [String: Any] {
        if let commentData = valueDictionary[Const.CommentPath] as? [String: Any] {
            //print("test0105n06")
            for commentDataElement in commentData {
                let commentValueDictionary = commentDataElement.value as! [String: Any]
                let commentName = commentValueDictionary["name"] as! String
                let commentBody = commentValueDictionary["comment"] as! String
                let commentTime = commentValueDictionary["time"] as! String
                let commentElement = Comment(id:commentDataElement.key, name:commentName, comment:commentBody, time:commentTime)
                self.commentArray.insert(commentElement, at: 0)
                //self.commentArray.sort(by: {Int($0.time!)! > Int($1.time!)!})
                self.commentArray.sort(by: {Double($0.time!)! > Double($1.time!)!})
            }
            //print(self.commentArray)
        }
    }
}
