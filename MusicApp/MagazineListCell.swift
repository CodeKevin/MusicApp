//
//  MagazineListCell.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/21.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class MagazineListCell: UITableViewCell {

    @IBOutlet weak var headImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func updataWithModel(_ model: TracksModel?) {
        titleLabel.text = model?.songname
        nameLabel.text = model?.songer
        let url = URL(string: (model?.songphoto)!)
        headImg.kf.setImage(with: url)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
