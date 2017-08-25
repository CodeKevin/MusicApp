//
//  SongListView.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/24.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
let SONGLISTCELL_ID = "songlistcellid"
typealias CloseBlock = ()-> Void
class SongListView: UIView {
    var tableView: UITableView!
    var songList:[TracksModel]?
    var closeBlock: CloseBlock?
    init(frame: CGRect, list: [TracksModel], index: Int) {
        super.init(frame: frame)
        self.songList = list
        self.backgroundColor = UIColor(white: 1, alpha: 0.6)
        createUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func createUI() {
        let effect = UIBlurEffect(style: .light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.contentView.backgroundColor = UIColor(white: 0.5, alpha: 0.1)
        effectView.frame = self.bounds
        addSubview(effectView)
        
        tableView = UITableView(frame:CGRect(x: 0, y: 10, width: SCREENW, height: frame.height - 44 - 10))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SongListCell", bundle: nil), forCellReuseIdentifier: SONGLISTCELL_ID)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear
        self.addSubview(tableView)
        
        let line = UIView(frame: CGRect(x: 0, y: frame.height - 44, width: SCREENW, height: 0.5))
        line.backgroundColor = UIColor.lightGray
        self.addSubview(line)
        
        let closeBtn = UIButton(type: .custom)
        closeBtn.frame = CGRect(x: 0, y: frame.height - 44, width: SCREENW, height: 44)
        closeBtn.setTitle("关闭", for: .normal)
        closeBtn.setTitleColor(UIColor.black, for: .normal)
        closeBtn.backgroundColor = UIColor.clear
        closeBtn.addTarget(self, action: #selector(hideListView), for: .touchUpInside)
        self.addSubview(closeBtn)
    }
    func hideListView() {
        if self.closeBlock != nil {
            self.closeBlock!()
        }
    }
}
extension SongListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.songList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SONGLISTCELL_ID, for: indexPath) as! SongListCell
        cell.titleLabel.text = self.songList?[indexPath.row].songname
        cell.nameLabel.text = self.songList?[indexPath.row].songer
        cell.backgroundColor = UIColor.clear
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //PlayerViewController.shared.p
    }
}
