//
//  MusicManViewController.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/9.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
let MOREMANID = "mormancellid"
class MusicManViewController: BaseViewController {
    var tableView: UITableView!
    var dataSource = [MoreManModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "乐人推荐"
        createUI()
        initData()
        // Do any additional setup after loading the view.
    }
    fileprivate func createUI() {
        tableView = UITableView(frame: rect)
        tableView.backgroundColor = kLightGrayColor
        tableView.register(UINib(nibName: "MoreManCell", bundle: nil), forCellReuseIdentifier: MOREMANID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
    }
    fileprivate func initData() {
        KVNetworkTool.shared.loadData(urlString: "http://wawa.fm:9090/wawa/api.php/document/getYuerenList", containerView: tableView) { (time, json) in
            if let list = json["list"].arrayObject {
                for dict in list {
                    let model = MoreManModel(dict: dict as! [String : AnyObject])
                    self.dataSource.append(model)
                }
                self.tableView.reloadData()
            }
        }
    }
}
extension MusicManViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = cell.transform.scaledBy(x: 0.8, y: 0.8)
        cell.alpha = 0.0
        UIView.animate(withDuration: 0.3) {
            cell.transform = .identity
            cell.alpha = 1.0
        }
    }
}
extension MusicManViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MOREMANID, for: indexPath) as! MoreManCell
        cell.updateWithData(model: self.dataSource[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340.0
    }
}
