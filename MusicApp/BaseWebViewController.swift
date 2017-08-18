//
//  BaseWebViewController.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/18.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import WebKit
let rect = CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH - 64)
class BaseWebViewController: UIViewController {
    var wkWebView: WKWebView!
    var articleId: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let configuration = WKWebViewConfiguration()
        wkWebView = WKWebView(frame: rect, configuration: configuration)
        let webUrl = URL(string: "http://wawa.fm/webview/content.html?uid=0&id=" + articleId!)
        let request = URLRequest(url: webUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 15.0)
        wkWebView.load(request)
        self.view.addSubview(wkWebView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
