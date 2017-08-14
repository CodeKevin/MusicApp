//
//  LookModel.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/14.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class LookModel: NSObject {
    var id: String?
    var title: String?
    var uid: String?
    var category_id: String?
    //var description: String?
    var cover_url: String?
    var type: String?
    var member_name: String?
    var category_name: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        id = dict["id"] as? String
        title = dict["title"] as? String
        uid = dict["uid"] as? String
        category_id = dict["category_id"] as? String
        //description = dict["description"] as? String
        cover_url = dict["cover_url"] as? String
        type = dict["type"] as? String
        member_name = dict["member_name"] as? String
        category_name = dict["category_name"] as? String
    }
}
