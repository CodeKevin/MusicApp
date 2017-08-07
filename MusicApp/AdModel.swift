//
//  AdModel.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class AdModel: NSObject {
    var id: String?
    var image: String?
    var flag: String?
    var link: String?
    var create_date: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        id = dict["id"] as? String
        image = dict["image"] as? String
        flag = dict["flag"] as? String
        link = dict["link"] as? String
        create_date = dict["create_date"] as? String
    }

}
