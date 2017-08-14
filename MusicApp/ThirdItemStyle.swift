//
//  ThirdItemStyle.swift
//  MusicApp
//
//  Created by Kevin on 2017/5/12.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit

class ThirdItemStyle: UICollectionViewCell {

    @IBOutlet weak var cenImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var headView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    func updateWithData(model: PlayModel){
        let url = URL(string: model.playlist_image!)
        cenImageView.kf.setImage(with: url)
        headView.kf.setImage(with: URL(string: model.pimg!))
        headView.layer.cornerRadius = 10.0
        headView.layer.masksToBounds = true
        countLabel.text = model.play_count
        nameLabel.text = model.playlist_name
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
