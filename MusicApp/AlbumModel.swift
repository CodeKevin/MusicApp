//
//  AlbumModel.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class AlbumModel: NSObject {
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
        mid = dict["mid"] as? String
        mcode = dict["mcode"] as? String
        resourcecode = dict["resourcecode"] as? String
        mnum = dict["mnum"] as? String
        mname = dict["mname"] as? String
        mdesc = dict["mdesc"] as? String
        mphoto = dict["mphoto"] as? String
        play_count = dict["play_count"] as? String
    }
}
