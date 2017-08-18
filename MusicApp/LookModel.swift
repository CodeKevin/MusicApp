//
//  LookModel.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/14.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class LookModel: BaseModel {
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
        setValuesForKeys(dict)
    }
}
