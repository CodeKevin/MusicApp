//
//  SectionCell.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/21.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
let SECTIONCELL_H = CGFloat(SCREENW * 9 / 16 + 75 + 10)
typealias ShowListBlock = ()-> Void
class SectionCell: UITableViewHeaderFooterView {
    public var showListBlock: ShowListBlock?
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 15, width: SCREENW-40, height: 20))
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        return titleLabel
    }()
    fileprivate lazy var numLabel: UILabel = {
        let numLabel = UILabel(frame: CGRect(x: 20, y: 45, width: 100, height: 15))
        numLabel.font = UIFont.systemFont(ofSize: 12)
        numLabel.textColor = UIColor.lightGray
        return numLabel
    }()
    fileprivate lazy var img: UIImageView = {
       let img = UIImageView(frame: CGRect(x: 110, y: 45, width: 15, height: 15))
        img.image = #imageLiteral(resourceName: "ico_listen")
        return img
    }()
    fileprivate lazy var countLabel: UILabel = {
        let countLabel = UILabel(frame: CGRect(x: 130, y: 45, width: 100, height: 15))
        countLabel.font = UIFont.systemFont(ofSize: 10)
        countLabel.textColor = UIColor.lightGray
        return countLabel
    }()
    fileprivate lazy var coverImg: UIImageView = {
        let coverImg = UIImageView(frame: CGRect(x: 0, y: 75, width: SCREENW, height: SCREENW * 9 / 16))
        coverImg.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(showSongsList))
        coverImg.addGestureRecognizer(tap)
        return coverImg
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: SECTIONCELL_ID)
        self.frame = CGRect(x: 0, y: 0, width: SCREENW, height: SECTIONCELL_H)
        self.contentView.backgroundColor = UIColor.white
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(numLabel)
        self.contentView.addSubview(img)
        self.contentView.addSubview(countLabel)
        self.contentView.addSubview(coverImg)
        let viewLine = UIView(frame: CGRect(x: 0, y: SECTIONCELL_H - 10, width: SCREENW, height: 10))
        viewLine.backgroundColor = kLightGrayColor
        self.contentView.addSubview(viewLine)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        
    }
    @objc fileprivate func showSongsList(_gesture: UITapGestureRecognizer) {
        if self.showListBlock != nil {
            self.showListBlock!()
        }
    }
    public func updataWithModel(_ model: MagazineModel) {
        titleLabel.text = model.mname
        numLabel.text = "第\(model.mnum!)期"
        countLabel.text = "\(model.play_count!)人听过"
        let url = URL(string: model.mphoto!)
        coverImg.kf.setImage(with: url)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
