//
//  BaseViewController.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/22.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import ReachabilitySwift
class BaseViewController: UIViewController {

    let reachability = Reachability()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = kLightGrayColor
        networkStatusListener()
        // Do any additional setup after loading the view.
    }

    func networkStatusListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged(note:)), name: ReachabilityChangedNotification, object: reachability)
        do {
            try reachability.startNotifier()
        } catch  {
            print("could not start reachability notifier")
        }
    }
    
    deinit {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: ReachabilityChangedNotification, object: reachability)
    }
    func reachabilityChanged(note: NSNotification) {
        let reachability = note.object as! Reachability
        if reachability.isReachable {
            print("net ok")
            if reachability.isReachableViaWiFi {
                print("wifi")
            }else {
                print("WWAN")
            }
        }else {
            DispatchQueue.main.async {
                 self.alert_noNetwork()
            }
        }
    }
    func alert_noNetwork() {
        let alert = UIAlertController(title: "tip", message: "open net", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func go(){
        print("change")
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
