//
//  MoreManCell.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/18.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class MoreManCell: UITableViewCell {

    @IBOutlet weak var coverImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var watchCount: UILabel!
    @IBOutlet weak var listenCount: UILabel!
    @IBOutlet weak var bottomView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        bottomView.backgroundColor = kLightGrayColor
        // Initialization code
    }
    func updateWithData(model: MoreManModel){
        let url = URL(string: model.cover_url!)
        coverImg.kf.setImage(with: url)
        titleLabel.text = Tool.headString(model.title!)
        desLabel.text = Tool.endString(model.title!)
        nameLabel.text = "文/" + model.editor!
        watchCount.text = model.view_count
        listenCount.text = model.playcount
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
        // Configure the view for the selected state
    }
    
}
