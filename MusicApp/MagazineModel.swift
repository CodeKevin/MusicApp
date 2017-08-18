//
//  MagazineModel.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/18.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class MagazineModel: BaseModel {
    var mid: String?
    var mname: String?
    var play_count: String?
    var mnum: String?
    var thumbnail_url: String?
    var tracks: [TracksModel]?
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
}
