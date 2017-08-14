//
//  KVNetworkTool.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/22.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import MJRefresh
import Alamofire
import SwiftyJSON
import MBProgressHUD

class KVNetworkTool: NSObject {
    static let shared = KVNetworkTool()
    func loadData(urlString: String, containerView: UIScrollView, finished:@escaping (_ nowtime: TimeInterval, _ data: JSON)->()) {
        containerView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            let nowTime = Date().timeIntervalSince1970
            Alamofire.request(urlString).validate().responseJSON { (responseData) in
                containerView.mj_header.endRefreshing()
                switch responseData.result {
                case .success:
                    let json = JSON(responseData.result.value!)
                    finished(nowTime, json)
                    print(json)
                case .failure(let error):
                    print(error)
                }
            }
        })
        containerView.mj_header.isAutomaticallyChangeAlpha = true
        containerView.mj_header.beginRefreshing()
    }
    func loadData(urlString: String, finished:@escaping (_ nowtime: TimeInterval, _ data: JSON)->()) {

            let nowTime = Date().timeIntervalSince1970
            Alamofire.request(urlString).validate().responseJSON { (responseData) in
                switch responseData.result {
                case .success:
                    let json = JSON(responseData.result.value!)
                    finished(nowTime, json)
                    print(json)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
