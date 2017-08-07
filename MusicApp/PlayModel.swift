//
//  PlayModel.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
class PlayModel: NSObject {

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
        id = dict["id"] as? String
        playlist_image = dict["playlist_image"] as? String
        playlist_small_image = dict["playlist_small_image"] as? String
        pimg = dict["pimg"] as? String
        username = dict["username"] as? String
        uid = dict["uid"] as? String
        playlist = dict["playlist"] as? String
        playlist_name = dict["playlist_name"] as? String
        status = dict["status"] as? String
        create_date = dict["create_date"] as? String
        desc = dict["desc"] as? String
        play_count = dict["play_count"] as? String
    }
}
