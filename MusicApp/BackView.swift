//
//  BackView.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/24.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class BackView: UIView {
    var listView: SongListView!
    var upView: UIView!
    init(frame: CGRect, list: [TracksModel], index: Int) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        upView = UIView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH))
        upView.isUserInteractionEnabled = true
        upView.backgroundColor = UIColor.black
        upView.alpha = 0.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(hide))
        upView.addGestureRecognizer(tap)
        self.addSubview(upView)
        
        listView = SongListView(frame: CGRect(x: 0, y: frame.height, width: SCREENW, height: frame.height - 240), list: list, index: index)
        listView.closeBlock = {[weak self] in
            if let sself = self {
                sself.hide()
            }
        }
        self.addSubview(listView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func showList() {
        UIView.animate(withDuration: 0.5) {
            self.upView.alpha = 0.5
            self.listView.transform = CGAffineTransform(translationX: 0, y: -self.frame.height + 240)
        }
    }
    @objc fileprivate func hide() {
        UIView.animate(withDuration: 0.5, animations: { 
            self.upView.alpha = 0.0
            self.listView.transform = .identity
        }) { (isHide) in
            if isHide {
                self.removeFromSuperview()
            }
        }
    }
}
