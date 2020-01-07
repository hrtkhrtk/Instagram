//
//  Comment.swift
//  Instagram
//
//  Created by hirotaka.iwasaki on 2020/01/05.
//  Copyright © 2020 hirotaka.iwasaki. All rights reserved.
//

import UIKit

class Comment: NSObject {
    //var id: String?
    //var name: String?
    //var comment: String?
    var id: String!
    var name: String!
    var comment: String!
    var time: String!
    
    init(id:String, name:String, comment:String, time:String) {
        self.id = id
        self.name = name
        self.comment = comment
        self.time = time
    }
}
