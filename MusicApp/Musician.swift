//
//  Musician.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class Musician: NSObject {
    var title: String?
    //var description: String?
    var id: String?
    var image : String?
    var musiccode: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        title = dict["title"] as? String
        id = dict["id"] as? String
        image = dict["image"] as? String
        musiccode = dict["musiccode"] as? String
    }
}


//
