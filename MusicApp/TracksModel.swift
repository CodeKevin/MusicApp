//
//  TracksModel.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/18.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
class TracksModel: BaseModel {
    var songer: String?
    var songname: String?
    var songphoto: String?
    init(dict: [String: AnyObject]) {
        super.init()
        songer = dict["songer"] as? String
        songname = dict["songname"] as? String
        songphoto = dict["songphoto"] as? String
    }
}
