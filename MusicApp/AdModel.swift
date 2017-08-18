//
//  AdModel.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class AdModel: BaseModel {
    var id: String?
    var image: String?
    var flag: String?
    var link: String?
    var create_date: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }

}
