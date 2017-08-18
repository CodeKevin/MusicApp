//
//  PlayModel.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
class PlayModel: BaseModel {

    var id: String?
    var playlist_image: String?
    var playlist_small_image: String?
    var pimg: String?
    var username: String?
    var uid: String?
    var playlist: String?
    var playlist_name: String?
    var status: String?
    var create_date: String?
    var desc: String?
    var play_count : String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
}
