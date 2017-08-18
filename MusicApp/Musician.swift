//
//  Musician.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/19.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class Musician: BaseModel {
    var title: String?
    var id: String?
    var image : String?
    var musiccode: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
}
