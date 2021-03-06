//
//  LookViewController.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/12.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
class LookViewController: BaseViewController{
    fileprivate var pageIndexChange: Int = 0
    var dataSource = ["29","650","653","30"]
    var titles = ["艺文","有品","旅行","应用"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        createPageView()
        // Do any additional setup after loading the view.
    }
    func createPageView() {
        var arr = [UIViewController]()
        for catId in dataSource {
            let vc = SubLookViewController()
            vc.catId = catId
            arr.append(vc)
        }
        let kvContentView = KVBarContentView(frame: rect, titles: titles, childVCs: arr, parentVC: self)
        self.view.addSubview(kvContentView)
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
