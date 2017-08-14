//
//  RootViewController.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/11.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createControllers()
        self.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    func createControllers() {
        let listenNVC = UINavigationController(rootViewController: ListenViewController())
        let lookNVC = UINavigationController(rootViewController: LookViewController())
        let circleNVC = UINavigationController(rootViewController: CircleViewController())
        self.viewControllers = [listenNVC,lookNVC,circleNVC]
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
