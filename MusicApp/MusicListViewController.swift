//
//  MusicListViewController.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/9.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
let SECTIONCELL_ID = "sectionid"
let DESCELL_ID = "descellid"
let LISTCELL_ID = "listcellid"
class MusicListViewController: BaseViewController {

    var tableView: UITableView!
    var dataSource = [MagazineModel]()
    var statusList = [Bool]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "猎乐合集"
        createUI()
        initData()
        // Do any additional setup after loading the view.
    }
    fileprivate func createUI() {
        tableView = UITableView(frame: rect, style: .grouped)
        tableView.backgroundColor = UIColor.white
        tableView.register(UINib(nibName: "MagazineDesCell", bundle: nil), forCellReuseIdentifier: DESCELL_ID)
        tableView.register(UINib(nibName: "MagazineListCell", bundle: nil), forCellReuseIdentifier: LISTCELL_ID)
        tableView.register(SectionCell.self, forHeaderFooterViewReuseIdentifier:SECTIONCELL_ID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
    }
    fileprivate func initData() {
        KVNetworkTool.shared.loadData(urlString: "http://wawa.fm:9090/wawa/api.php/magazine/magazinelist", containerView: tableView) { (time, json) in
            if let list = json.arrayObject {
                for dict in list {
                    let model = MagazineModel(dict: dict as! [String : AnyObject])
                    self.dataSource.append(model)
                    self.statusList.append(false)
                }
                self.tableView.reloadData()
            }
        }
    }

}
extension MusicListViewController: UITableViewDelegate {
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
extension MusicListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  self.statusList[section] {
            return (self.dataSource[section].tracks?.count)! + 1
        }else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DESCELL_ID, for: indexPath) as! MagazineDesCell
            cell.contentView.backgroundColor = kLightGrayColor
            cell.desLabel.text = self.dataSource[indexPath.section].mdesc
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: LISTCELL_ID, for: indexPath) as! MagazineListCell
            let magazineModel = self.dataSource[indexPath.section]
            let listModel = magazineModel.tracks?[indexPath.row - 1]
            cell.updataWithModel(listModel)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var sectionCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: SECTIONCELL_ID) as? SectionCell
        if sectionCell == nil {
            sectionCell = SectionCell(reuseIdentifier: SECTIONCELL_ID)
        }
        sectionCell?.showListBlock =  {[weak self] in
            if let sself = self {
                if sself.statusList[section] {
                    sself.statusList[section] = false
                }else {
                    sself.statusList[section] = true
                }
                sself.tableView.reloadSections(IndexSet([section]), with: .fade)
            }
        }
        sectionCell?.updataWithModel(self.dataSource[section])
        return sectionCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SECTIONCELL_H
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return MagazineDesCell.contentHeight(self.dataSource[indexPath.section].mdesc! as NSString) + 50.0
        }else {
            return 84
        }
    }
}
