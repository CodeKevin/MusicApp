//
//  AlbumModel.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class AlbumModel: BaseModel {
    var mid: String?
    var mcode: String?
    var resourcecode: String?
    var mnum: String?
    var mname: String?
    var mdesc: String?
    var mphoto: String?
    var play_count: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
}
