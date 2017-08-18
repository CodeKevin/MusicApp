//
//  Tool.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/18.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class Tool: NSObject {
    class func headString(_ string: String) -> String {
        let arr = string.components(separatedBy: "：")
        return arr[0]
    }
    class func endString(_ string: String) -> String {
        let arr = string.components(separatedBy: "：")
        if arr.count >= 1 {
            return arr[1]
        }
        return ""
    }
}
