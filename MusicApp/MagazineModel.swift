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
    var mphoto: String?
    var mdesc: String?
    var tracks: [TracksModel]?
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "tracks" {
            var modelArr = [TracksModel]()
            let arr = value as! [Any]
            for dic in arr {
                let model = TracksModel(dict: dic as! [String : AnyObject])
                modelArr.append(model)
            }
            tracks = modelArr
            return
        }
        super.setValue(value, forKey: key)
    }
}
