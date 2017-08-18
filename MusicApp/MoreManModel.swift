//
//  MoreManModel.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/18.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class MoreManModel: BaseModel {
    var id: String?
    var title: String?
    var descrip: String?
    var cover_url: String?
    var view: String?
    var editor: String?
    var musiccode: String?
    var songname: String?
    var track_id: String?
    var playcount: String?
    var view_count: String?
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
}
