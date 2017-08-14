//
//  KVConst.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/12.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
/// 第一次启动
let YMFirstLaunch = "firstLaunch"
/// 是否登录
let isLogin = "isLogin"
/// 动画时长
let kAnimationDuration = 0.25
/// 屏幕的宽
let SCREENW = UIScreen.main.bounds.size.width
/// 屏幕的高
let SCREENH = UIScreen.main.bounds.size.height
/// iPhone 5
let isIPhone5 = SCREENH == 568 ? true : false
/// iPhone 6
let isIPhone6 = SCREENH == 667 ? true : false
/// iPhone 6P
let isIPhone6P = SCREENH == 736 ? true : false
/// randColor
let randColor = UIColor(red:CGFloat(Double(arc4random()%256)/255.0) , green: CGFloat(Double(arc4random()%254)/255.0), blue: CGFloat(Double(arc4random()%254)/255.0), alpha: 1.0)
/// backgroudColor
let kLightGrayColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1)
/// scale
let SCALE = SCREENW/320
